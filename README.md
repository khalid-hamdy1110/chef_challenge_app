# Chef Challenge App

Chef Challenge is a Flutter application designed to turn cooking into a fun, gamified experience. Race against the clock, follow recipes step-by-step, and track your performance to become a kitchen champion.

The app provides timed challenges based on recipes, where each step has an expected duration and an acceptable time margin. After completing a recipe, you receive a detailed summary of your performance.

# Video Demo: [Chef Challenge Video Demo](https://www.linkedin.com/posts/khalid-hamdy_flutter-appdevelopment-softwareengineering-activity-7370003076742635520-f-l9)

## Features

- **Gamified Cooking:** Engage in timed cooking challenges to improve your skills.
- **Performance Analysis:** Receive detailed summaries after each challenge, comparing your time against expected durations.
- **Personalized Difficulty:** Set your cooking skill level (Beginner, Intermediate, Chef) to tailor the challenge.
- **Recipe Discovery:** Explore various recipes, including a "Recipe of the Day," with search and tag-filtering capabilities.
- **Favorites & History:** Save your favorite recipes and track your completed challenges in a history log.
- **Adaptive UI:** A clean, dark-themed user interface that works across different screen sizes.

## Technology Stack

- **Framework:** Flutter
- **State Management:** BLoC / Cubit
- **Navigation:** `auto_route`
- **Data Models:** `freezed`
- **UI:** Custom widgets, `google_fonts`, `flutter_svg`, `blurrycontainer`

## Project Structure

The project follows a feature-driven architecture, with a clear separation of concerns.

```
lib/
├── models.dart           # Core data models using Freezed
├── route_config/         # Navigation setup with auto_route
├── screens/              # UI widgets for each screen of the app
├── states/               # BLoC/Cubit state management logic
│   ├── challenge/
│   ├── explore/
│   └── user/
├── widgets/              # Reusable custom UI components
└── main.dart             # Main application entry point
```

---

## State Management Overview

Chef Challenge uses the [flutter_bloc](https://pub.dev/packages/flutter_bloc) package with the Cubit pattern for modular, testable state management. Each major feature area has its own Cubit and immutable state class (using [Freezed](https://pub.dev/packages/freezed)):

- **UserCubit** (`states/user/user_cubit.dart`):  
  Manages the user's name, selected cooking difficulty, favorites, and challenge history.  
  - State: [`UserState`](lib/states/user/user_state.dart)  
    - `Difficulty? cookingLevel` — User's selected skill level (`beginner`, `intermediate`, `chef`)
    - `String? name` — User's display name
    - `List<Recipe> favorites` — Favorite recipes
    - `List<RecipeHistory> history` — Completed challenge summaries

- **ExploreCubit** (`states/explore/explore_cubit.dart`):  
  Handles the recipe list, tag-based filtering, search, and toggling between list/grid views.  
  - State: [`ExploreState`](lib/states/explore/explore_state.dart)  
    - `Recipe? recipeOfTheDay` — Highlighted recipe (rotates daily)
    - `bool listView` — UI toggle for list/grid
    - `List<Recipe> recipes` — All available recipes (see demo data)
    - `List<Recipe> filteredRecipe` — Recipes after search/tag filtering
    - `List<Tag> selectedTags` — Active tag filters

- **ChallengeCubit** (not shown, but implied by `challenge_state.dart`):  
  Manages the lifecycle of an active cooking challenge, including timers, step progression, and summary results.
  - State: [`ChallengeState`](lib/states/challenge/challenge_state.dart)  
    - `int currentStepIndex` — Which step the user is on
    - `Duration elapsedTime` — Time spent on the current step
    - `Duration totalElapsedTime` — Total challenge time
    - `bool isRunning` — Timer status
    - `bool isCompleted` — Challenge completion flag
    - `List<SummaryStep> stepsSummary` — Per-step results (actual time, margin status, etc.)

All state classes are immutable and support copyWith, equality, and pattern matching via Freezed.

---

## Routing

Navigation is managed with [auto_route](https://pub.dev/packages/auto_route), which centralizes all route definitions in [`route_config/app_router.dart`](lib/route_config/app_router.dart):

- **OnboardRoute**: Initial onboarding (name & difficulty)
- **NavigationBarRoute**: Main shell with bottom navigation
  - **ExploreShellRoute**: Nested stack for recipe exploration and challenge flow
    - **ExploreRoute**: Recipe list
    - **RecipeDetailsRoute**: Recipe detail view
    - **RecipeChallengeRoute**: Active challenge UI
    - **RecipeChallengeSummaryRoute**: Challenge results
  - **FavoritesRoute**: User's favorite recipes
  - **HistoryRoute**: Challenge history

**To update routes:**  
Edit `app_router.dart` and run:
```
dart run build_runner watch
```

This regenerates `app_router.gr.dart` for type-safe navigation.

---

## Models

All domain models are defined in [`models.dart`](lib/models.dart) and generated with Freezed for immutability and convenience methods.

- **Difficulty**:  
  Enum for user skill level and recipe difficulty (`beginner`, `intermediate`, `chef`).

- **Recipe**:  
  Represents a full recipe, including metadata, nutrition, steps, and tags.
  - `String name`
  - `List<Tag> tags`
  - `RecipeType recipeType` (`meat` or `vegetarian`)
  - `Difficulty difficulty`
  - `String description`
  - `List<Ingredient> ingredients`
  - `int calories`, `protein`, `carbs`
  - `List<RecipeStep> steps`
  - `String imageUrl`
  - **Extensions**:  
    - `difficultyFactor(Difficulty userLevel)`: Adjusts time margins based on user skill
    - `totalDuration`: Sums all step durations
    - `totalAcceptableMargin(Difficulty userLevel)`: Sums all step margins, adjusted for user skill
    - `prepTime` / `cookingTime`: Sums durations by step type

- **RecipeStep**:  
  One step in a recipe, with timing and margin for challenge scoring.
  - `int number`
  - `String name`
  - `String description`
  - `StepType stepType` (`prep` or `cooking`)
  - `Duration duration`
  - `Duration acceptableMarginDuration`
  - `String? comment`

- **SummaryStep**:  
  Captures the result of a completed step in a challenge.
  - `RecipeStep step`
  - `Duration timeTaken`
  - `AcceptanceMarginStatus marginStatus` (`beforeMargin`, `withinMargin`, `afterMargin`)
  - `Duration totalTimeTaken`

- **RecipeHistory**:  
  Stores a completed challenge for history.
  - `Recipe recipe`
  - `List<SummaryStep> summary`

- **Tag, RecipeType, StepType, AcceptanceMarginStatus**:  
  Enums for recipe categorization, step type, and challenge scoring.

---

**See [`models.dart`](lib/models.dart) for full definitions and extension methods.**

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK installed on your machine.

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/khalid-hamdy1110/chef_challenge_app.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd chef_challenge_app
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the build runner to generate necessary files for `freezed` and `auto_route`:**
    ```sh
    dart run build_runner watch
    ```
5.  **Run the app:**
    ```sh
    flutter run

---
> Developed as part of the Flutter Diploma, Summer 2025 (Edges Academy) © 2025 Khalid Hamdy
