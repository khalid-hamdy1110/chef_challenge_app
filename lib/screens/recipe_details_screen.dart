import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:chef_challenge_project/widgets/custom_button.dart';
import 'package:chef_challenge_project/widgets/custom_divider.dart';
import 'package:chef_challenge_project/widgets/custom_text.dart';
import 'package:chef_challenge_project/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  bool overview = true;

  void _switchOverviewSteps(bool isOverview) {
    setState(() {
      overview = isOverview;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 17, 24, 1),
      extendBodyBehindAppBar: true,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _recipeImageAndGradient(context),
            Transform.translate(
              offset: Offset(
                0,
                -(MediaQuery.of(context).size.width.clamp(0, 450).toDouble() *
                    0.23),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    _titleAndTagsAndType(),
                    const CustomDivider(),
                    _tabSwitcher(),
                    const SizedBox(height: 16),
                    overview ? _overviewSection() : _stepsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        label: 'Start',
        icon: SvgPicture.asset('assets/icons/start.svg'),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        onPressed: () {
          context.router.push(RecipeChallengeRoute(recipe: widget.recipe));
        },
      ),
    );
  }

  Row _titleAndTagsAndType() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: widget.recipe.name,
                nunito: false,
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: TextColor.white,
              ),
              Wrap(
                children: [
                  ...List.generate(
                    widget.recipe.tags.length,
                    (index) => TagPill(recipe: widget.recipe, index: index),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: widget.recipe.recipeType == RecipeType.meat
                ? const Color.fromRGBO(215, 98, 97, 0.1)
                : const Color.fromRGBO(74, 188, 150, 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: widget.recipe.recipeType == RecipeType.meat
                ? SvgPicture.asset(
                    'assets/icons/meat.svg',
                    width: 24,
                    height: 24,
                  )
                : SvgPicture.asset(
                    'assets/icons/leaf.svg',
                    width: 24,
                    height: 24,
                  ),
          ),
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => context.router.pop(),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(43, 46, 51, 0.2),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: BlurryContainer(
                blur: 15,
                color: const Color.fromRGBO(43, 46, 51, 0.1),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/back_arrow.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => context.read<UserCubit>().onFavorite(widget.recipe),
            child: BlocSelector<UserCubit, UserState, List<Recipe>>(
              selector: (state) => state.favorites,
              builder: (context, favorites) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(43, 46, 51, 0.2),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: BlurryContainer(
                    blur: 15,
                    color: const Color.fromRGBO(43, 46, 51, 0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      favorites.contains(widget.recipe)
                          ? 'assets/icons/heart_filled.svg'
                          : 'assets/icons/heart_outline.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column _stepsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'Timeline',
          nunito: false,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: TextColor.white,
        ),
        const SizedBox(height: 8),
        TimelineBar(
          prepTime: widget.recipe.prepTime,
          cookingTime: widget.recipe.cookingTime,
          totalDuration: widget.recipe.totalDuration,
        ),
        const CustomDivider(),
        ...List.generate(widget.recipe.steps.length, (index) {
          final step = widget.recipe.steps[index];

          return StepCard(step: step);
        }),
      ],
    );
  }

  Column _overviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _infoCard(
                'assets/icons/clock.svg',
                'Total Time',
                '${widget.recipe.totalDuration.inMinutes} Minutes',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _infoCard(
                'assets/icons/steps.svg',
                'Steps',
                '${widget.recipe.steps.length} Steps',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _infoCard(
                'assets/icons/fire.svg',
                'Difficulty',
                widget.recipe.difficulty.name[0].toUpperCase() +
                    widget.recipe.difficulty.name.substring(1),
                difficulty: widget.recipe.difficulty,
              ),
            ),
            const SizedBox(width: 8),
            BlocSelector<UserCubit, UserState, Difficulty>(
              selector: (state) => state.cookingLevel!,
              builder: (context, cookingLevel) => Expanded(
                child: _infoCard(
                  'assets/icons/hammer.svg',
                  'Acceptable Margin',
                  '${widget.recipe.totalAcceptableMargin(cookingLevel).inMinutes} Minutes',
                ),
              ),
            ),
          ],
        ),
        const CustomDivider(),
        _descriptionSection(),
        const CustomDivider(),
        const CustomText(
          text: 'Ingredients',
          nunito: false,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: TextColor.white,
        ),
        ...List.generate(
          widget.recipe.ingredients.length,
          (index) => Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.recipe.ingredients[index].amount,
                  nunito: true,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: TextColor.grey,
                ),
                CustomText(
                  text: widget.recipe.ingredients[index].name,
                  nunito: true,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: TextColor.white,
                ),
              ],
            ),
          ),
        ),
        const CustomDivider(),
        const CustomText(
          text: 'Nutrition',
          nunito: false,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: TextColor.white,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(24, 27, 33, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const CustomText(
                      text: 'Calories',
                      nunito: true,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: TextColor.grey,
                    ),
                    const SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.recipe.calories.toString(),
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'kcal',
                            style: GoogleFonts.hedvigLettersSerif(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(136, 132, 129, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 65,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(43, 46, 51, 0),
                      Color.fromRGBO(43, 46, 51, 0.93),
                      Color.fromRGBO(43, 46, 51, 1),
                      Color.fromRGBO(43, 46, 51, 0.93),
                      Color.fromRGBO(43, 46, 51, 0),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const CustomText(
                      text: 'Protein',
                      nunito: true,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: TextColor.grey,
                    ),
                    const SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.recipe.protein.toString(),
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'g',
                            style: GoogleFonts.hedvigLettersSerif(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(136, 132, 129, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 65,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(43, 46, 51, 0),
                      Color.fromRGBO(43, 46, 51, 0.93),
                      Color.fromRGBO(43, 46, 51, 1),
                      Color.fromRGBO(43, 46, 51, 0.93),
                      Color.fromRGBO(43, 46, 51, 0),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const CustomText(
                      text: 'Carbohydrates',
                      nunito: true,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: TextColor.grey,
                    ),
                    const SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.recipe.carbs.toString(),
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'g',
                            style: GoogleFonts.hedvigLettersSerif(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(136, 132, 129, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text _descriptionSection() {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: ' '),
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: SvgPicture.asset(
              'assets/icons/quote.svg',
              width: 17,
              height: 14,
            ),
          ),
          TextSpan(
            text: ' ${widget.recipe.description} ',
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.bottom,
            child: SvgPicture.asset(
              'assets/icons/unquote.svg',
              width: 17,
              height: 14,
            ),
          ),
        ],
      ),
    );
  }

  Container _infoCard(
    String iconUrl,
    String label1,
    String label2, {
    Difficulty? difficulty,
  }) {
    int difficultyNum;
    switch (difficulty) {
      case null:
        difficultyNum = 0;
      case Difficulty.beginner:
        difficultyNum = 1;
      case Difficulty.intermediate:
        difficultyNum = 3;
      case Difficulty.chef:
        difficultyNum = 5;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 27, 33, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(219, 122, 43, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              iconUrl,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(219, 122, 43, 1),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomText(
                      text: label1,
                      nunito: true,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: TextColor.grey,
                    ),
                    if (difficulty != null)
                      Wrap(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Container(
                              margin: const EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                color: index < difficultyNum
                                    ? const Color.fromRGBO(219, 122, 43, 1)
                                    : const Color.fromRGBO(136, 132, 129, 1),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              width: 2,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                CustomText(
                  text: label2,
                  nunito: true,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: TextColor.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _tabSwitcher() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 27, 33, 1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color.fromRGBO(43, 46, 51, 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => _switchOverviewSteps(true),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 6.5),
                  decoration: BoxDecoration(
                    color: overview
                        ? const Color.fromRGBO(43, 46, 51, 1)
                        : null,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: CustomText(
                      text: 'Overview',
                      nunito: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TextColor.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _switchOverviewSteps(false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 6.5),
                  decoration: BoxDecoration(
                    color: !overview
                        ? const Color.fromRGBO(43, 46, 51, 1)
                        : null,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: CustomText(
                      text: 'Steps',
                      nunito: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TextColor.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _recipeImageAndGradient(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Container(
              width: double.infinity,
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(14, 17, 24, 1),
                    Color.fromRGBO(14, 17, 24, 0.05),
                    Color.fromRGBO(14, 17, 24, 0.92),
                    Color.fromRGBO(14, 17, 24, 1),
                  ],
                ),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: widget.recipe.imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
