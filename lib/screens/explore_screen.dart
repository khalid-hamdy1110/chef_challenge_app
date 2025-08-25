import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:chef_challenge_project/adaptive_framework.dart';
import 'package:chef_challenge_project/models.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:chef_challenge_project/widgets/reusable_widgets.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';
import 'package:chef_challenge_project/states/explore/explore_cubit.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:chef_challenge_project/states/explore/explore_state.dart';
import 'package:chef_challenge_project/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final menuController = MenuController();
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExploreCubit()
        ..updateRecipeOfTheDay()
        ..toggleListView(
          getAdaptiveValue(context: context, mobile: true, tablet: false),
        ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(14, 17, 24, 1),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.all(16) - const EdgeInsets.only(bottom: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _greetingAndDifficultySelectorBar()),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                SliverToBoxAdapter(child: _recipeOfTheDayCard()),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(child: _randomRecipeCard()),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                const SliverToBoxAdapter(
                  child: CustomText(
                    text: 'Recipes',
                    nunito: false,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: TextColor.white,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 8)),
                SliverToBoxAdapter(child: _searchSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                _recipeListSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocSelector<
    ExploreCubit,
    ExploreState,
    ({bool listView, List<Recipe> recipes})
  >
  _recipeListSection() {
    return BlocSelector<
      ExploreCubit,
      ExploreState,
      ({List<Recipe> recipes, bool listView})
    >(
      selector: (state) =>
          (recipes: state.filteredRecipe, listView: state.listView),
      builder: (context, data) => data.listView
          ? SliverList.builder(
              itemCount: data.recipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = data.recipes[index];
                return RecipeCard(recipe: recipe);
              },
            )
          : SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                crossAxisSpacing: 8,
                childAspectRatio: 3 / 4,
              ),
              itemCount: data.recipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = data.recipes[index];
                return RecipeGridCard(recipe: recipe);
              },
            ),
    );
  }

  Row _searchSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 15, top: 11, bottom: 11),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(24, 27, 33, 1),
              border: Border.all(color: const Color.fromRGBO(43, 46, 51, 1)),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: BlocSelector<ExploreCubit, ExploreState, ExploreState>(
                    selector: (state) => state,
                    builder: (context, state) => TextField(
                      controller: searchController,
                      onChanged: (value) => context
                          .read<ExploreCubit>()
                          .filterRecipes(searchWord: value),
                      decoration: const InputDecoration(
                        hint: CustomText(
                          text: 'Search for a recipe...',
                          nunito: true,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: TextColor.grey,
                          maxLines: 1,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 4),

        BlocSelector<ExploreCubit, ExploreState, bool>(
          selector: (state) => state.listView,
          builder: (context, listView) => Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(24, 27, 33, 1),
              border: Border.all(color: const Color.fromRGBO(43, 46, 51, 1)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () =>
                      context.read<ExploreCubit>().toggleListView(false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: !listView
                          ? const Color.fromRGBO(43, 46, 51, 1)
                          : null,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        'assets/icons/gridview.svg',
                        key: ValueKey<bool>(!listView),
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          !listView
                              ? Colors.white
                              : const Color.fromRGBO(43, 46, 51, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () =>
                      context.read<ExploreCubit>().toggleListView(true),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: listView
                          ? const Color.fromRGBO(43, 46, 51, 1)
                          : null,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        'assets/icons/listview.svg',
                        key: ValueKey<bool>(listView),
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          listView
                              ? Colors.white
                              : const Color.fromRGBO(43, 46, 51, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 4),

        BlocSelector<ExploreCubit, ExploreState, List<Tag>>(
          selector: (state) => state.selectedTags,
          builder: (context, selectedTags) {
            return GestureDetector(
              onTap: () {
                final exploreCubit = context.read<ExploreCubit>();

                showDialog(
                  context: context,
                  builder: (dialogueContext) => BlocProvider.value(
                    value: exploreCubit,
                    child: BlocSelector<ExploreCubit, ExploreState, List<Tag>>(
                      selector: (state) => state.selectedTags,
                      builder: (context, selectedTags) {
                        return AlertDialog(
                          backgroundColor: const Color.fromRGBO(24, 27, 33, 1),
                          title: Row(
                            children: [
                              const CustomText(
                                text: 'Filter by Tag',
                                nunito: true,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: TextColor.white,
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<ExploreCubit>().clearTags();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedSuperellipseBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    188,
                                    0,
                                    0,
                                  ),
                                ),
                                child: const CustomText(
                                  text: 'Clear',
                                  nunito: true,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: TextColor.white,
                                ),
                              ),
                            ],
                          ),
                          content: Wrap(
                            spacing: 5,
                            children: [
                              ...List.generate(
                                Tag.values.length,
                                (index) => FilterChip(
                                  selected: selectedTags.contains(
                                    Tag.values[index],
                                  ),
                                  onSelected: (selected) => context
                                      .read<ExploreCubit>()
                                      .onTagSelect(Tag.values[index]),
                                  label: CustomText(
                                    text:
                                        Tag.values[index].name[0]
                                            .toUpperCase() +
                                        Tag.values[index].name.substring(1),
                                    nunito: true,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: TextColor.white,
                                  ),
                                  checkmarkColor: Colors.white,
                                  selectedColor: const Color.fromRGBO(
                                    219,
                                    122,
                                    43,
                                    1,
                                  ),
                                  backgroundColor: const Color.fromRGBO(
                                    43,
                                    46,
                                    51,
                                    1,
                                  ),
                                  shape: RoundedSuperellipseBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                context.read<ExploreCubit>().filterRecipes(
                                  searchWord: searchController.text,
                                );
                                context.router.pop();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(8),
                                backgroundColor: const Color.fromRGBO(
                                  219,
                                  122,
                                  43,
                                  1,
                                ),
                              ),
                              child: const CustomText(
                                text: 'Apply Filter',
                                nunito: true,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: TextColor.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(24, 27, 33, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(43, 46, 51, 1),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(
                  'assets/icons/filter.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  BlocSelector<ExploreCubit, ExploreState, List<Recipe>> _randomRecipeCard() {
    return BlocSelector<ExploreCubit, ExploreState, List<Recipe>>(
      selector: (state) => state.recipes,
      builder: (context, recipes) => GestureDetector(
        onTap: () => context.router.push(
          RecipeDetailsRoute(recipe: recipes[Random().nextInt(recipes.length)]),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color.fromRGBO(24, 27, 33, 1),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/dice.svg', width: 50, height: 50),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Random Recipe',
                      nunito: true,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: TextColor.white,
                    ),
                    CustomText(
                      text: "Don't know what to cook?",
                      nunito: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: TextColor.white,
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/icons/random_arrow.svg',
                width: 40,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocSelector<ExploreCubit, ExploreState, Recipe> _recipeOfTheDayCard() {
    return BlocSelector<ExploreCubit, ExploreState, Recipe>(
      selector: (state) {
        return state.recipeOfTheDay!;
      },
      builder: (context, recipeOfTheDay) => GestureDetector(
        onTap: () =>
            context.pushRoute(RecipeDetailsRoute(recipe: recipeOfTheDay)),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipeOfTheDay.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(24, 27, 33, 1),
                  Color.fromRGBO(24, 27, 33, 0.9),
                  Color.fromRGBO(24, 27, 33, 0),
                ],
              ),
            ),
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              bottom: 16,
              right: 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/medal.svg',
                      width: 16,
                      height: 16,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: CustomText(
                        text: "Today's Challenge",
                        nunito: true,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TextColor.white,
                      ),
                    ),
                  ],
                ),
                CustomText(
                  text: recipeOfTheDay.name,
                  nunito: false,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: TextColor.orange,
                ),
                const SizedBox(height: 4),
                Wrap(
                  children: [
                    ...List.generate(
                      recipeOfTheDay.tags.length,
                      (index) => TagPill(recipe: recipeOfTheDay, index: index),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 4,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/clock.svg',
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(width: 4),
                        BlocSelector<UserCubit, UserState, Difficulty>(
                          selector: (state) => state.cookingLevel!,
                          builder: (context, cookingLevel) => CustomText(
                            text:
                                '${(recipeOfTheDay.totalAcceptableMargin(cookingLevel) + recipeOfTheDay.totalDuration).inMinutes} Minutes',
                            nunito: true,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: TextColor.grey,
                          ),
                        ),
                      ],
                    ),
                    const CustomText(
                      text: '-',
                      nunito: true,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: TextColor.grey,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/step.svg',
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(width: 4),
                        CustomText(
                          text:
                              '${recipeOfTheDay.steps.length.toString()} Steps',
                          nunito: true,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: TextColor.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.router.push(
                      RecipeChallengeRoute(recipe: recipeOfTheDay),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    backgroundColor: const Color.fromRGBO(219, 122, 43, 1),
                  ),
                  child: const CustomText(
                    text: 'Start Challenge',
                    nunito: true,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: TextColor.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IntrinsicHeight _greetingAndDifficultySelectorBar() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    CustomText(
                      text: _getCurrentGreeting(),
                      nunito: false,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: TextColor.white,
                    ),
                    BlocSelector<UserCubit, UserState, String?>(
                      selector: (state) => state.name,
                      builder: (context, name) => CustomText(
                        text: '$name!',
                        nunito: false,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: TextColor.orange,
                      ),
                    ),
                  ],
                ),
                const CustomText(
                  text: 'Ready to cook something amazing?',
                  nunito: true,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: TextColor.grey,
                ),
              ],
            ),
          ),
          Column(
            children: [
              BlocSelector<UserCubit, UserState, String>(
                selector: (state) {
                  switch (state.cookingLevel) {
                    case Difficulty.beginner:
                      return '🍳 Beginner';
                    case Difficulty.intermediate:
                      return '👨🏻‍🍳 Intermediate';
                    case Difficulty.chef:
                      return '🔥 Chef';
                    case null:
                      return '';
                  }
                },
                builder: (context, cookingLevelLabel) => MenuAnchor(
                  controller: menuController,
                  builder: (context, controller, _) {
                    return GestureDetector(
                      onTap: () => controller.isOpen
                          ? controller.close()
                          : controller.open(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(24, 27, 33, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(43, 46, 51, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            CustomText(
                              text: cookingLevelLabel,
                              nunito: true,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: TextColor.white,
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              'assets/icons/dropdown_arrow.svg',
                              width: 16,
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  menuChildren: [
                    MenuItemButton(
                      child: const CustomText(
                        text: '🍳 Beginner',
                        nunito: true,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TextColor.white,
                      ),
                      onPressed: () {
                        context.read<UserCubit>().setCookingLevel(
                          Difficulty.beginner,
                        );
                        menuController.close();
                      },
                    ),
                    MenuItemButton(
                      child: const CustomText(
                        text: '👨‍🍳 Intermediate',
                        nunito: true,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TextColor.white,
                      ),
                      onPressed: () {
                        context.read<UserCubit>().setCookingLevel(
                          Difficulty.intermediate,
                        );
                        menuController.close();
                      },
                    ),
                    MenuItemButton(
                      child: const CustomText(
                        text: '🔥 Chef',
                        nunito: true,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TextColor.white,
                      ),
                      onPressed: () {
                        context.read<UserCubit>().setCookingLevel(
                          Difficulty.chef,
                        );
                        menuController.close();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getCurrentGreeting() {
    int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning, ';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon, ';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening, ';
    }
    return 'Good Night, ';
  }
}
