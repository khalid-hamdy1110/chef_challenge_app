import 'package:chef_challenge_project/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_state.freezed.dart';

@freezed
abstract class ExploreState with _$ExploreState {
  const factory ExploreState({
    required Recipe? recipeOfTheDay,
    required bool listView,
    required List<Recipe> recipes,
    required List<Recipe> filteredRecipe,
    required List<Tag> selectedTags,
  }) = _ExploreState;

  factory ExploreState.initial() {
    final List<Recipe> recipes = [
      // =========================
      // DEMO RECIPE (5–10 min)
      // =========================
      const Recipe(
        name: 'Garlic-Butter Tomato Scramble',
        tags: [Tag.eggs, Tag.vegetables],
        recipeType: RecipeType.vegetarian,
        difficulty: Difficulty.beginner,
        description:
            'Creamy soft-scrambled eggs with a bright burst of garlicky tomatoes on toasted sourdough. Fast, forgiving, and ideal for a short live demo — easy to talk through while cooking. Serve immediately so the eggs remain silky and the toast stays crisp.',
        imageUrl: 'assets/images/demo_scramble.jpg',
        ingredients: [
          Ingredient(amount: '3', name: 'Eggs'),
          Ingredient(amount: '2 slices', name: 'Sourdough or country bread'),
          Ingredient(amount: '1 cup', name: 'Cherry tomatoes, halved'),
          Ingredient(amount: '1 tbsp', name: 'Unsalted butter'),
          Ingredient(amount: '1 tbsp', name: 'Olive oil'),
          Ingredient(amount: '1', name: 'Garlic clove, minced'),
          Ingredient(amount: '1 tbsp', name: 'Chopped parsley (optional)'),
          Ingredient(amount: 'to taste', name: 'Salt & black pepper'),
          Ingredient(amount: 'pinch', name: 'Chili flakes (optional)'),
        ],
        calories: 450,
        protein: 23,
        carbs: 36,
        steps: [
          RecipeStep(
            number: 1,
            name: 'Quick prep',
            description:
                'Halve tomatoes, mince garlic, chop parsley. Crack eggs and whisk lightly.',
            stepType: StepType.prep,
            duration: Duration(minutes: 2, seconds: 30),
            acceptableMarginDuration: Duration(minutes: 1),
            comment: 'Don’t over-whisk; a few streaks of white are fine.',
          ),
          RecipeStep(
            number: 2,
            name: 'Toast bread',
            description: 'Toast sourdough to your liking. Keep warm.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 2, seconds: 30),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 3,
            name: 'Tomatoes & garlic',
            description:
                'Heat olive oil medium-high. Sauté tomatoes 60–90 sec; add garlic 30 sec until fragrant.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(minutes: 1),
            comment: 'Pull early if garlic browns too fast.',
          ),
          RecipeStep(
            number: 4,
            name: 'Soft scramble',
            description:
                'Lower heat to medium-low, add butter, then eggs. Stir constantly until barely set and glossy (~90 sec).',
            stepType: StepType.cooking,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 5,
            name: 'Assemble & serve',
            description:
                'Top toast with eggs and tomatoes. Finish with parsley and a crack of black pepper; serve immediately.',
            stepType: StepType.prep,
            duration: Duration(minutes: 1),
            acceptableMarginDuration: Duration(seconds: 30),
          ),
        ],
      ),

      // =========================
      // 1) Chicken & Veggie Stir-Fry with Rice (Beginner)
      // =========================
      const Recipe(
        name: 'Chicken & Veg Stir-Fry',
        tags: [Tag.chicken, Tag.vegetables, Tag.rice, Tag.sauce],
        recipeType: RecipeType.meat,
        difficulty: Difficulty.beginner,
        description:
            'Tender chicken and crisp vegetables tossed in a glossy soy-garlic sauce, served over jasmine rice. A forgiving, fast weeknight meal — great for batching and crowd-pleasing. Timing is relaxed; keep sauce thick but not gluey.',
        imageUrl: 'assets/images/chicken_stir_fry.jpg',
        ingredients: [
          Ingredient(amount: '300 g', name: 'Chicken breast, thinly sliced'),
          Ingredient(amount: '1 cup', name: 'Jasmine rice (uncooked)'),
          Ingredient(amount: '1', name: 'Red bell pepper, sliced'),
          Ingredient(amount: '1', name: 'Medium carrot, thinly sliced'),
          Ingredient(amount: '150 g', name: 'Broccoli florets'),
          Ingredient(amount: '2 tbsp', name: 'Neutral oil'),
          Ingredient(amount: '2', name: 'Garlic cloves, minced'),
          Ingredient(amount: '1 tsp', name: 'Fresh ginger, grated'),
          Ingredient(amount: '2 tbsp', name: 'Soy sauce'),
          Ingredient(amount: '1 tbsp', name: 'Oyster sauce (optional)'),
          Ingredient(amount: '1 tbsp', name: 'Honey or brown sugar'),
          Ingredient(amount: '1 tbsp', name: 'Cornstarch + 2 tbsp water'),
          Ingredient(amount: 'to taste', name: 'Salt & black pepper'),
          Ingredient(amount: 'optional', name: 'Sesame seeds & scallions'),
        ],
        calories: 650,
        protein: 40,
        carbs: 75,
        steps: [
          RecipeStep(
            number: 1,
            name: 'Cook rice',
            description:
                'Rinse rice until water runs clear. Cook per package (stovetop or cooker). Keep warm.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 18),
            acceptableMarginDuration: Duration(minutes: 3),
            comment: 'Start rice first so it finishes with the stir-fry.',
          ),
          RecipeStep(
            number: 2,
            name: 'Prep produce & chicken',
            description:
                'Slice chicken and vegetables; mince garlic and grate ginger.',
            stepType: StepType.prep,
            duration: Duration(minutes: 10),
            acceptableMarginDuration: Duration(minutes: 3),
          ),
          RecipeStep(
            number: 3,
            name: 'Mix sauce',
            description:
                'Combine soy, oyster (optional), honey, and cornstarch slurry.',
            stepType: StepType.prep,
            duration: Duration(minutes: 3),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 4,
            name: 'Sear chicken',
            description:
                'Heat 1 tbsp oil on high. Season chicken and stir-fry until just cooked. Remove.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(minutes: 2),
          ),
          RecipeStep(
            number: 5,
            name: 'Veggies',
            description:
                'Add 1 tbsp oil. Stir-fry broccoli 2 min, then carrot and pepper until crisp-tender.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 4),
            acceptableMarginDuration: Duration(minutes: 2),
          ),
          RecipeStep(
            number: 6,
            name: 'Sauce',
            description:
                'Return chicken. Pour sauce; toss 60–90 seconds until glossy and thickened.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 3),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 7,
            name: 'Serve',
            description:
                'Fluff rice and top with stir-fry. Garnish if desired.',
            stepType: StepType.prep,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
        ],
      ),

      // =========================
      // 2) Creamy Tomato-Basil Pasta (Intermediate, Vegetarian)
      // =========================
      const Recipe(
        name: 'Creamy Tomato Basil Pasta',
        tags: [Tag.pasta, Tag.vegetables, Tag.sauce],
        recipeType: RecipeType.vegetarian,
        difficulty: Difficulty.intermediate,
        description:
            'Silky, emulsified pasta with tomato paste, cream, and basil — quick but timing-sensitive to achieve a glossy sauce. Finish with reserved pasta water and cheese for a silky texture.',
        imageUrl: 'assets/images/creamy_tomato_pasta.jpg',
        ingredients: [
          Ingredient(amount: '200 g', name: 'Spaghetti or short pasta'),
          Ingredient(amount: '3 tbsp', name: 'Tomato paste'),
          Ingredient(amount: '3', name: 'Garlic cloves, thinly sliced'),
          Ingredient(amount: '1/2 tsp', name: 'Chili flakes (optional)'),
          Ingredient(amount: '1/2 cup', name: 'Heavy cream or cooking cream'),
          Ingredient(amount: '1/2 cup', name: 'Finely grated Parmesan'),
          Ingredient(amount: '1 handful', name: 'Fresh basil, torn'),
          Ingredient(amount: '2 tbsp', name: 'Olive oil'),
          Ingredient(amount: 'to taste', name: 'Salt & black pepper'),
        ],
        calories: 720,
        protein: 22,
        carbs: 95,
        steps: [
          RecipeStep(
            number: 1,
            name: 'Boil water',
            description: 'Bring a large pot of salted water to a rolling boil.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 8),
            acceptableMarginDuration: Duration(minutes: 1, seconds: 30),
          ),
          RecipeStep(
            number: 2,
            name: 'Prep aromatics',
            description: 'Slice garlic and tear basil. Grate cheese if needed.',
            stepType: StepType.prep,
            duration: Duration(minutes: 4),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 3,
            name: 'Cook pasta',
            description:
                'Cook pasta 1 minute shy of package time. Reserve 1 cup pasta water.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 9),
            acceptableMarginDuration: Duration(minutes: 1, seconds: 30),
          ),
          RecipeStep(
            number: 4,
            name: 'Build sauce',
            description:
                'Warm oil; bloom garlic (and chili). Stir in tomato paste 1–2 min, then cream. Season and keep heat moderate.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(minutes: 1, seconds: 30),
            comment: 'Keep heat moderate; don’t brown garlic.',
          ),
          RecipeStep(
            number: 5,
            name: 'Emulsify',
            description:
                'Add pasta to sauce with splashes of pasta water and cheese, tossing until glossy and emulsified.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 6,
            name: 'Finish',
            description: 'Fold in basil, adjust seasoning, and serve.',
            stepType: StepType.prep,
            duration: Duration(minutes: 1),
            acceptableMarginDuration: Duration(seconds: 30),
          ),
        ],
      ),

      // =========================
      // 3) Seared Steak with Crispy Potatoes & Chimichurri (Chef)
      // =========================
      const Recipe(
        name: 'Seared Steak & Crispy Potatoes',
        tags: [Tag.meat, Tag.potatoes, Tag.sauce],
        recipeType: RecipeType.meat,
        difficulty: Difficulty.chef,
        description:
            'Precise searing and timing: medium-rare steak with crackly potatoes and bright chimichurri. This one requires attention to timing and temperature for best results.',
        imageUrl: 'assets/images/steak_chimichurri.jpg',
        ingredients: [
          Ingredient(amount: '350 g', name: 'Steak (sirloin or ribeye)'),
          Ingredient(amount: '500 g', name: 'Waxy potatoes, halved'),
          Ingredient(amount: '1 bunch', name: 'Parsley, finely chopped'),
          Ingredient(amount: '2', name: 'Garlic cloves, minced'),
          Ingredient(amount: '1 tbsp', name: 'Red wine vinegar'),
          Ingredient(
            amount: '3 tbsp',
            name: 'Olive oil (plus more for cooking)',
          ),
          Ingredient(amount: '1/4 tsp', name: 'Chili flakes'),
          Ingredient(amount: '1 tbsp', name: 'Butter (for basting)'),
          Ingredient(amount: 'to taste', name: 'Salt & black pepper'),
        ],
        calories: 800,
        protein: 50,
        carbs: 45,
        steps: [
          RecipeStep(
            number: 1,
            name: 'Chimichurri',
            description:
                'Mix parsley, garlic, vinegar, olive oil, chili, salt, and pepper. Set aside.',
            stepType: StepType.prep,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(seconds: 45),
          ),
          RecipeStep(
            number: 2,
            name: 'Parboil potatoes',
            description:
                'Boil salted water and cook potatoes until just tender at edges.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 10),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 3,
            name: 'Sear steak',
            description:
                'Pat steak dry, season well. Sear in hot oil 2–3 min per side; add butter and baste to desired doneness.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 8),
            acceptableMarginDuration: Duration(seconds: 45),
            comment: 'Aim for 52–54°C / 125–130°F for medium-rare.',
          ),
          RecipeStep(
            number: 4,
            name: 'Rest steak',
            description:
                'Transfer steak to rest on a rack, tent lightly with foil.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 5),
            acceptableMarginDuration: Duration(seconds: 45),
          ),
          RecipeStep(
            number: 5,
            name: 'Crisp potatoes',
            description:
                'Smash or toss parboiled potatoes; crisp in the steak pan until golden.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(seconds: 45),
          ),
          RecipeStep(
            number: 6,
            name: 'Slice & plate',
            description:
                'Slice steak against the grain. Serve with potatoes and chimichurri.',
            stepType: StepType.prep,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(seconds: 30),
          ),
        ],
      ),

      // =========================
      // 4) Shakshuka (Intermediate, Vegetarian)
      // =========================
      const Recipe(
        name: 'Shakshuka',
        tags: [Tag.eggs, Tag.vegetables, Tag.sauce],
        recipeType: RecipeType.vegetarian,
        difficulty: Difficulty.intermediate,
        description:
            'Eggs simmered in a cumin–paprika tomato and pepper sauce. Saucy, aromatic, and perfect with crusty bread for dipping. Keep a lid handy to set whites while keeping yolks runny.',
        imageUrl: 'assets/images/shakshuka.jpg',
        ingredients: [
          Ingredient(amount: '1', name: 'Onion, sliced'),
          Ingredient(amount: '1', name: 'Red bell pepper, sliced'),
          Ingredient(amount: '2 tbsp', name: 'Olive oil'),
          Ingredient(amount: '3', name: 'Garlic cloves, minced'),
          Ingredient(amount: '1 tsp', name: 'Ground cumin'),
          Ingredient(amount: '1 tsp', name: 'Sweet paprika'),
          Ingredient(amount: '1 pinch', name: 'Chili flakes'),
          Ingredient(amount: '400 g', name: 'Canned crushed tomatoes'),
          Ingredient(amount: '4', name: 'Eggs'),
          Ingredient(amount: 'optional', name: 'Feta, parsley, bread to serve'),
          Ingredient(amount: 'to taste', name: 'Salt & black pepper'),
        ],
        calories: 520,
        protein: 26,
        carbs: 35,
        steps: [
          RecipeStep(
            number: 1,
            name: 'Slice & mince',
            description: 'Slice onion and pepper, mince garlic, gather spices.',
            stepType: StepType.prep,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 2,
            name: 'Aromatics',
            description:
                'Sauté onion and pepper in olive oil until softened; add garlic and spices and cook until fragrant.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(minutes: 1, seconds: 30),
          ),
          RecipeStep(
            number: 3,
            name: 'Simmer sauce',
            description: 'Add tomatoes, season, and simmer until thickened.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 10),
            acceptableMarginDuration: Duration(minutes: 2),
          ),
          RecipeStep(
            number: 4,
            name: 'Add eggs',
            description: 'Make wells and crack in eggs. Season lightly.',
            stepType: StepType.prep,
            duration: Duration(minutes: 1),
            acceptableMarginDuration: Duration(seconds: 45),
          ),
          RecipeStep(
            number: 5,
            name: 'Set eggs',
            description:
                'Cover and cook until whites set and yolks are runny or to preference.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 6,
            name: 'Finish',
            description:
                'Crumble feta, sprinkle parsley, and serve with bread.',
            stepType: StepType.prep,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(seconds: 30),
          ),
        ],
      ),

      // =========================
      // 5) One-Pan Lemon-Herb Chicken & Rice (Intermediate)
      // =========================
      const Recipe(
        name: 'Lemon-Herb Chicken & Rice',
        tags: [Tag.chicken, Tag.rice, Tag.sauce],
        recipeType: RecipeType.meat,
        difficulty: Difficulty.intermediate,
        description:
            'Golden seared chicken simmered over garlicky, lemony rice — a complete one-pan dinner. Hands-on searing followed by gentle simmering yields moist chicken and infused rice.',
        imageUrl: 'assets/images/lemon_chicken_rice.jpg',
        ingredients: [
          Ingredient(
            amount: '500 g',
            name: 'Bone-in chicken thighs, patted dry',
          ),
          Ingredient(amount: '1 cup', name: 'Long-grain rice, rinsed'),
          Ingredient(amount: '2 cups', name: 'Chicken stock'),
          Ingredient(amount: '1', name: 'Lemon (zest + juice)'),
          Ingredient(amount: '3', name: 'Garlic cloves, minced'),
          Ingredient(amount: '1 tsp', name: 'Dried oregano'),
          Ingredient(amount: '2 tbsp', name: 'Olive oil'),
          Ingredient(amount: 'to taste', name: 'Salt & black pepper'),
          Ingredient(amount: 'optional', name: 'Parsley to finish'),
        ],
        calories: 700,
        protein: 45,
        carbs: 80,
        steps: [
          RecipeStep(
            number: 1,
            name: 'Season chicken',
            description:
                'Season thighs generously with salt, pepper, zest, and oregano.',
            stepType: StepType.prep,
            duration: Duration(minutes: 5),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 2,
            name: 'Sear',
            description:
                'Heat oil over medium-high. Sear chicken skin-side down until deep golden; flip briefly.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(minutes: 1, seconds: 30),
          ),
          RecipeStep(
            number: 3,
            name: 'Toast rice & garlic',
            description: 'Remove chicken. Add garlic and rice; cook 1–2 min.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 4,
            name: 'Simmer',
            description:
                'Add stock and lemon juice; return chicken on top. Cover and simmer until rice is tender and chicken cooked.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 18),
            acceptableMarginDuration: Duration(minutes: 2),
          ),
          RecipeStep(
            number: 5,
            name: 'Rest',
            description: 'Off heat, rest covered to steam for fluffier rice.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 5),
            acceptableMarginDuration: Duration(minutes: 1, seconds: 30),
          ),
          RecipeStep(
            number: 6,
            name: 'Finish & serve',
            description: 'Fluff rice, adjust seasoning, garnish with parsley.',
            stepType: StepType.prep,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(seconds: 45),
          ),
        ],
      ),

      // =========================
      // 6) Crispy Paprika Potatoes with Garlic Yogurt (Beginner, Vegetarian)
      // =========================
      const Recipe(
        name: 'Crispy Paprika Potatoes',
        tags: [Tag.potatoes, Tag.sauce, Tag.vegetables],
        recipeType: RecipeType.vegetarian,
        difficulty: Difficulty.beginner,
        description:
            'Rough-and-tumble roasted potatoes with smoked paprika and a cool garlic-yogurt sauce. Crunchy exterior, tender interior — great as a side or a shareable snack.',
        imageUrl: 'assets/images/paprika_potatoes.jpg',
        ingredients: [
          Ingredient(amount: '700 g', name: 'Potatoes, cut into chunks'),
          Ingredient(amount: '3 tbsp', name: 'Olive oil'),
          Ingredient(amount: '1 tsp', name: 'Smoked paprika'),
          Ingredient(amount: '1/2 tsp', name: 'Garlic powder'),
          Ingredient(amount: '1/2 cup', name: 'Plain yogurt'),
          Ingredient(amount: '1', name: 'Garlic clove, grated'),
          Ingredient(amount: '1 tsp', name: 'Lemon juice'),
          Ingredient(amount: 'to taste', name: 'Salt & black pepper'),
          Ingredient(amount: 'optional', name: 'Parsley, chopped'),
        ],
        calories: 600,
        protein: 12,
        carbs: 70,
        steps: [
          RecipeStep(
            number: 1,
            name: 'Preheat & prep',
            description:
                'Preheat oven to 220°C / 425°F. Cut potatoes into chunks.',
            stepType: StepType.prep,
            duration: Duration(minutes: 10),
            acceptableMarginDuration: Duration(minutes: 2),
          ),
          RecipeStep(
            number: 2,
            name: 'Season',
            description:
                'Toss potatoes with oil, paprika, garlic powder, salt, pepper.',
            stepType: StepType.prep,
            duration: Duration(minutes: 3),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 3,
            name: 'Roast',
            description:
                'Spread on a sheet and roast, flipping once, until crisp and tender.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 25),
            acceptableMarginDuration: Duration(minutes: 4),
            comment: 'Flip at halfway for even browning.',
          ),
          RecipeStep(
            number: 4,
            name: 'Garlic yogurt',
            description: 'Mix yogurt with grated garlic, lemon juice, salt.',
            stepType: StepType.prep,
            duration: Duration(minutes: 3),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 5,
            name: 'Serve',
            description:
                'Sprinkle parsley and serve potatoes with yogurt on the side.',
            stepType: StepType.prep,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
        ],
      ),

      // =========================
      // 7) Weeknight Lemon-Garlic Salmon Pasta (Beginner)
      // =========================
      const Recipe(
        name: 'Lemon-Garlic Salmon Pasta',
        tags: [Tag.pasta, Tag.sauce, Tag.meat],
        recipeType: RecipeType.meat,
        difficulty: Difficulty.beginner,
        description:
            'Flaky salmon folded through a lemon-garlic butter pasta. Simple, bright, and comforting — a quick weeknight favourite that comes together in under 30 minutes.',
        imageUrl: 'assets/images/salmon_pasta.jpg',
        ingredients: [
          Ingredient(amount: '200 g', name: 'Pasta (fusilli or spaghetti)'),
          Ingredient(amount: '250 g', name: 'Salmon fillet, skinless'),
          Ingredient(amount: '2 tbsp', name: 'Butter'),
          Ingredient(amount: '1 tbsp', name: 'Olive oil'),
          Ingredient(amount: '2', name: 'Garlic cloves, minced'),
          Ingredient(amount: '1', name: 'Lemon (zest + juice)'),
          Ingredient(amount: 'to taste', name: 'Salt & black pepper'),
          Ingredient(amount: 'optional', name: 'Parsley, chopped'),
        ],
        calories: 680,
        protein: 36,
        carbs: 80,
        steps: [
          RecipeStep(
            number: 1,
            name: 'Boil pasta',
            description:
                'Cook pasta in salted water; reserve a cup of pasta water.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 9),
            acceptableMarginDuration: Duration(minutes: 2),
          ),
          RecipeStep(
            number: 2,
            name: 'Cook salmon',
            description:
                'Season salmon. Pan-sear in olive oil 2–3 min per side until just opaque; flake.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 6),
            acceptableMarginDuration: Duration(minutes: 2),
          ),
          RecipeStep(
            number: 3,
            name: 'Sauce base',
            description:
                'Melt butter; add garlic 30–60 sec, then lemon zest and juice.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 4,
            name: 'Combine',
            description:
                'Toss pasta with sauce, splash pasta water to emulsify. Fold in salmon.',
            stepType: StepType.cooking,
            duration: Duration(minutes: 2),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
          RecipeStep(
            number: 5,
            name: 'Serve',
            description: 'Season, garnish with parsley, and serve.',
            stepType: StepType.prep,
            duration: Duration(minutes: 1),
            acceptableMarginDuration: Duration(minutes: 1),
          ),
        ],
      ),
    ];

    return ExploreState(
      recipeOfTheDay: null,
      listView: true,
      recipes: recipes,
      filteredRecipe: recipes,
      selectedTags: [],
    );
  }
}
