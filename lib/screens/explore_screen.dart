import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_challenge_project/adaptive_framework.dart';
import 'package:chef_challenge_project/data/recipe_api_service.dart';
import 'package:chef_challenge_project/models/api_result.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:chef_challenge_project/widgets/custom_button.dart';
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
  final nameController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExploreCubit(RecipeApiService())
        ..loadRecipes()
        ..toggleListView(
          getAdaptiveValue(context: context, mobile: true, tablet: false),
        ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(14, 17, 24, 1),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.all(16) - const EdgeInsets.only(bottom: 16),
            child: BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(219, 122, 43, 1),
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(219, 122, 43, 1),
                    ),
                  ),
                  failure: (err) =>
                      _errorView(err, context.read<ExploreCubit>().loadRecipes),
                  success:
                      (
                        recipes,
                        filteredRecipes,
                        allTags,
                        recipeOfTheDay,
                        listView,
                        selectedTags,
                      ) {
                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: _greetingAndDifficultySelectorBar(context),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 32),
                            ),
                            SliverToBoxAdapter(
                              child: _recipeOfTheDayCard(recipeOfTheDay!),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 16),
                            ),
                            SliverToBoxAdapter(
                              child: _randomRecipeCard(recipes),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 32),
                            ),
                            const SliverToBoxAdapter(
                              child: CustomText(
                                text: 'Recipes',
                                nunito: false,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: TextColor.white,
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 8),
                            ),
                            SliverToBoxAdapter(
                              child: _searchSection(
                                context: context,
                                listView: listView,
                                allTags: allTags,
                                selectedTags: selectedTags,
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 16),
                            ),
                            _recipeListSection(listView, filteredRecipes),
                          ],
                        );
                      },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _recipeListSection(bool listView, List<Recipe> recipes) {
    if (recipes.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CustomText(
            text: 'No recipes found.',
            nunito: true,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: TextColor.grey,
          ),
        ),
      );
    }

    return listView
        ? SliverList.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              Recipe recipe = recipes[index];
              return RecipeCard(recipe: recipe);
            },
          )
        : SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              crossAxisSpacing: 8,
              childAspectRatio: 3 / 4,
            ),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              Recipe recipe = recipes[index];
              return RecipeGridCard(recipe: recipe);
            },
          );
  }

  Row _searchSection({
    required BuildContext context,
    required bool listView,
    required List<String> allTags,
    required List<String> selectedTags,
  }) {
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
                  child: TextField(
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
              ],
            ),
          ),
        ),

        const SizedBox(width: 4),

        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(24, 27, 33, 1),
            border: Border.all(color: const Color.fromRGBO(43, 46, 51, 1)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.read<ExploreCubit>().toggleListView(false),
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
                onTap: () => context.read<ExploreCubit>().toggleListView(true),
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

        const SizedBox(width: 4),

        GestureDetector(
          onTap: () {
            final exploreCubit = context.read<ExploreCubit>();

            showDialog(
              context: context,
              builder: (dialogueContext) => BlocProvider.value(
                value: exploreCubit,
                child: BlocBuilder<ExploreCubit, ExploreState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const Text(''),
                      success:
                          (
                            recipes,
                            filteredRecipes,
                            allTags,
                            recipeOfTheDay,
                            listView,
                            selectedTags,
                          ) => AlertDialog(
                            backgroundColor: const Color.fromRGBO(
                              24,
                              27,
                              33,
                              1,
                            ),
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
                              runSpacing: 5,
                              children: [
                                ...List.generate(allTags.length, (index) {
                                  return FilterChip(
                                    selected: selectedTags.contains(
                                      allTags[index],
                                    ),
                                    onSelected: (selected) => context
                                        .read<ExploreCubit>()
                                        .onTagSelect(allTags[index]),
                                    label: CustomText(
                                      text:
                                          allTags[index][0].toUpperCase() +
                                          allTags[index].substring(1),
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
                                  );
                                }),
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
                          ),
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
              border: Border.all(color: const Color.fromRGBO(43, 46, 51, 1)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              'assets/icons/filter.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector _randomRecipeCard(List<Recipe> recipes) {
    return GestureDetector(
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
    );
  }

  GestureDetector _recipeOfTheDayCard(Recipe recipeOfTheDay) {
    return GestureDetector(
      onTap: () =>
          context.pushRoute(RecipeDetailsRoute(recipe: recipeOfTheDay)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(recipeOfTheDay.imageUrl),
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
                        text: '${recipeOfTheDay.steps.length.toString()} Steps',
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
    );
  }

  IntrinsicHeight _greetingAndDifficultySelectorBar(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (modalContext) => BlocBuilder<UserCubit, UserState>(
                    builder: (stateContext, state) {
                      return Padding(
                        padding: EdgeInsetsGeometry.only(
                          right: 16,
                          left: 16,
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  top: 11,
                                  bottom: 11,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(24, 27, 33, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(43, 46, 51, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit, size: 16),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextField(
                                        controller: nameController,
                                        decoration: const InputDecoration(
                                          hint: CustomText(
                                            text: 'Edit name...',
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
                                  ],
                                ),
                              ),
                              CustomButton(
                                onPressed: () {
                                  if (nameController.text.isNotEmpty) {
                                    stateContext.read<UserCubit>().setName(
                                      nameController.text,
                                    );
                                    nameController.text = '';
                                  }
                                  context.router.pop();
                                },
                                label: 'Save',
                                icon: SvgPicture.asset(
                                  'assets/icons/check.svg',
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
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

  Widget _errorView(ApiError error, VoidCallback onRetry) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildErrorIcon(error),
            const SizedBox(height: 16),
            CustomText(
              text: _getErrorTitle(error),
              nunito: true,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: TextColor.white,
            ),
            const SizedBox(height: 12),
            CustomText(
              text: _getErrorMessage(error),
              nunito: true,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: _getErrorColorCustom(error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, color: Colors.white, size: 16),
              label: const CustomText(
                text: 'Retry',
                nunito: true,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: TextColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorIcon(ApiError error) {
    return Icon(_getErrorIcon(error), size: 60, color: _getErrorColor(error));
  }

  IconData _getErrorIcon(ApiError error) {
    return switch (error.type) {
      ApiErrorType.network => Icons.wifi_off,
      ApiErrorType.timeout => Icons.timer_off,
      ApiErrorType.server => Icons.cloud_off,
      ApiErrorType.unknown => Icons.error_outline,
    };
  }

  Color _getErrorColor(ApiError error) {
    return switch (error.type) {
      ApiErrorType.network => Colors.orange,
      ApiErrorType.timeout => Colors.amber,
      ApiErrorType.server => Colors.red,
      ApiErrorType.unknown => Colors.red,
    };
  }

  TextColor _getErrorColorCustom(ApiError error) {
    return switch (error.type) {
      ApiErrorType.network => TextColor.orange,
      ApiErrorType.timeout => TextColor.amber,
      ApiErrorType.server => TextColor.red,
      ApiErrorType.unknown => TextColor.red,
    };
  }

  String _getErrorTitle(ApiError error) {
    return switch (error.type) {
      ApiErrorType.network => 'No Internet Connection',
      ApiErrorType.timeout => 'Connection Timed Out',
      ApiErrorType.server => 'Server Error',
      ApiErrorType.unknown => 'Something Went Wrong',
    };
  }

  String _getErrorMessage(ApiError error) {
    switch (error.statusCode) {
      case 400:
        return '400 - Something went wrong while fetching recipes. Please try again.';
      case 401:
        return "401 - We're having trouble connecting to the recipe service. Please try again later.";
      case 403:
        return "403 - Recipes aren't available right now.";
      case 404:
        return '404 - Recipes not found. Please try again later.';
      case 408:
        return '408 - The request took too long. Check your internet and try again.';
      case 429:
        return "429 - You're making too many requests. Please wait a bit and try again.";
      case 500:
        return '500 - The recipe service is having issues. Please try again later.';
      case 503:
        return "503 - You're offline. Please check your connection.";
      default:
        return '${error.statusCode} - Unknown Error';
    }
  }
}
