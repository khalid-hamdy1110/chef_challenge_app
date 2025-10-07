import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:chef_challenge_project/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chef_challenge_project/reusable_functions.dart';

class RecipeGridCard extends StatelessWidget {
  const RecipeGridCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(RecipeDetailsRoute(recipe: recipe)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color.fromRGBO(24, 27, 33, 1),
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: recipe.imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 10,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(24, 27, 33, 0),
                              Color.fromRGBO(24, 27, 33, 0.7),
                              Color.fromRGBO(24, 27, 33, 1),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: recipe.recipeType == RecipeType.meat
                                  ? const Color.fromRGBO(215, 98, 97, 1)
                                  : const Color.fromRGBO(74, 188, 150, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: recipe.recipeType == RecipeType.meat
                                  ? SvgPicture.asset(
                                      'assets/icons/meat.svg',
                                      width: 16,
                                      height: 16,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/leaf.svg',
                                      width: 16,
                                      height: 16,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () =>
                                context.read<UserCubit>().onFavorite(recipe),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(24, 27, 33, 1),
                                border: Border.all(
                                  color: const Color.fromRGBO(43, 46, 51, 1),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child:
                                    BlocSelector<
                                      UserCubit,
                                      UserState,
                                      List<Recipe>
                                    >(
                                      selector: (state) => state.favorites,
                                      builder: (context, favorites) =>
                                          SvgPicture.asset(
                                            favorites.contains(recipe)
                                                ? 'assets/icons/heart_filled.svg'
                                                : 'assets/icons/heart_outline.svg',
                                            width: 16,
                                            height: 16,
                                          ),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      CustomText(
                        text: recipe.name,
                        nunito: true,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: TextColor.white,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        children: [
                          ...List.generate(
                            recipe.tags.length.clamp(0, 4),
                            (i) => TagPill(recipe: recipe, index: i),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Wrap(
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
                        CustomText(
                          text:
                              '${recipe.totalDuration.inMinutes.toString()} Minutes',
                          nunito: true,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: TextColor.grey,
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
                          text: '${recipe.steps.length.toString()} Steps',
                          nunito: true,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: TextColor.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(RecipeDetailsRoute(recipe: recipe)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color.fromRGBO(24, 27, 33, 1),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: recipe.imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 10,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(24, 27, 33, 0),
                              Color.fromRGBO(24, 27, 33, 0.7),
                              Color.fromRGBO(24, 27, 33, 1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    CustomText(
                      text: recipe.name,
                      nunito: true,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: TextColor.white,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      children: [
                        ...List.generate(
                          recipe.tags.length.clamp(0, 4),
                          (i) => TagPill(recipe: recipe, index: i),
                        ),
                      ],
                    ),
                    const Spacer(),
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
                                    '${(recipe.totalDuration + recipe.totalAcceptableMargin(cookingLevel)).inMinutes} Minutes',
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
                              text: '${recipe.steps.length.toString()} Steps',
                              nunito: true,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: TextColor.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => context.read<UserCubit>().onFavorite(recipe),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(43, 46, 51, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child:
                              BlocSelector<UserCubit, UserState, List<Recipe>>(
                                selector: (state) => state.favorites,
                                builder: (context, favorites) =>
                                    SvgPicture.asset(
                                      favorites.contains(recipe)
                                          ? 'assets/icons/heart_filled.svg'
                                          : 'assets/icons/heart_outline.svg',
                                      width: 16,
                                      height: 16,
                                    ),
                              ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: recipe.recipeType == RecipeType.meat
                            ? const Color.fromRGBO(215, 98, 97, 0.1)
                            : const Color.fromRGBO(74, 188, 150, 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: recipe.recipeType == RecipeType.meat
                            ? SvgPicture.asset(
                                'assets/icons/meat.svg',
                                width: 16,
                                height: 16,
                              )
                            : SvgPicture.asset(
                                'assets/icons/leaf.svg',
                                width: 16,
                                height: 16,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagPill extends StatelessWidget {
  const TagPill({super.key, required this.recipe, required this.index});

  final Recipe recipe;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(43, 46, 51, 1),
      ),
      child: CustomText(
        text:
            recipe.tags[index][0].toUpperCase() +
            recipe.tags[index].substring(1),
        nunito: true,
        fontSize: 9,
        fontWeight: FontWeight.w500,
        color: TextColor.white,
      ),
    );
  }
}

class TimelineBar extends StatelessWidget {
  const TimelineBar({
    super.key,
    required this.prepTime,
    required this.cookingTime,
    required this.totalDuration,
  });

  final int prepTime;
  final int cookingTime;
  final Duration totalDuration;

  @override
  Widget build(BuildContext context) {
    double prepTimeRatio = prepTime.toDouble() / totalDuration.inMinutes;

    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(35, 157, 102, 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Transform.translate(
                          offset: const Offset(0, 2),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(35, 157, 102, 1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' Prep - ${prepTime}m',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(35, 157, 102, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: prepTime, child: const SizedBox()),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(219, 122, 43, 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Transform.translate(
                          offset: const Offset(0, 2),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(219, 122, 43, 1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' Cooking - ${cookingTime}m',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(219, 122, 43, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: cookingTime, child: const SizedBox()),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                colors: const [
                  Color.fromRGBO(35, 157, 102, 0.4),
                  Color.fromRGBO(219, 122, 43, 0.4),
                ],
                stops: [
                  (prepTimeRatio - 0.05).clamp(0, 1),
                  (prepTimeRatio + 0.05).clamp(0, 1),
                ],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(14, 17, 24, 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                height: 18,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    colors: const [
                      Color.fromRGBO(35, 157, 102, 0.2),
                      Color.fromRGBO(219, 122, 43, 0.2),
                    ],
                    stops: [
                      (prepTimeRatio - 0.1).clamp(0, 1),
                      (prepTimeRatio + 0.1).clamp(0, 1),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepCard extends StatelessWidget {
  const StepCard({super.key, required this.step, this.nextUp});

  final RecipeStep step;
  final bool? nextUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: nextUp != true ? 16 : 0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 27, 33, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: step.stepType == StepType.prep
                      ? const Color.fromRGBO(35, 157, 102, 0.2)
                      : const Color.fromRGBO(219, 122, 43, 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Center(
                  child: CustomText(
                    text: step.number.toString(),
                    nunito: true,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: step.stepType == StepType.prep
                        ? TextColor.green
                        : TextColor.orange,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomText(
                  text: step.name,
                  nunito: true,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: TextColor.white,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: SvgPicture.asset(
                            'assets/icons/clock.svg',
                            width: 12,
                            height: 12,
                          ),
                        ),
                        TextSpan(
                          text: ' ${step.duration.inMinutes} Minutes',
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(136, 132, 129, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: step.stepType == StepType.prep
                      ? const Color.fromRGBO(35, 157, 102, 0.2)
                      : const Color.fromRGBO(219, 122, 43, 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: step.stepType == StepType.prep
                            ? const Color.fromRGBO(35, 157, 102, 1)
                            : const Color.fromRGBO(219, 122, 43, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const SizedBox(width: 4),
                    CustomText(
                      text: step.stepType == StepType.prep ? 'Prep' : 'Cooking',
                      nunito: true,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: step.stepType == StepType.prep
                          ? TextColor.green
                          : TextColor.orange,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),

          const SizedBox(height: 4),
          if (nextUp != true) ...[
            CustomText(
              text: step.description,
              nunito: true,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: TextColor.grey,
            ),
            if (step.comment != null)
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(43, 46, 51, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/info.svg',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: CustomText(
                        text: step.comment!,
                        nunito: true,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: TextColor.white,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class LiveTimelineBar extends StatelessWidget {
  const LiveTimelineBar({
    super.key,
    required this.prepTime,
    required this.cookingTime,
    required this.totalDuration,
    required this.elapsedTime,
    required this.currentStepDuration,
    required this.totalElapsedTime,
  });

  final int prepTime;
  final int cookingTime;
  final Duration totalDuration;
  final Duration elapsedTime;
  final Duration currentStepDuration;
  final Duration totalElapsedTime;

  @override
  Widget build(BuildContext context) {
    final prepTimeRatio = prepTime.toDouble() / totalDuration.inMinutes;
    final elapsedTimeRatio =
        totalElapsedTime.inMilliseconds / totalDuration.inMilliseconds;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(35, 157, 102, 0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Transform.translate(
                        offset: const Offset(0, 2),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(35, 157, 102, 1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' Prep - ${prepTime}m',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(35, 157, 102, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: prepTime, child: const SizedBox()),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(219, 122, 43, 0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Transform.translate(
                        offset: const Offset(0, 2),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(219, 122, 43, 1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' Cooking - ${cookingTime}m',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(219, 122, 43, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: cookingTime, child: const SizedBox()),
          ],
        ),
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                      colors: const [
                        Color.fromRGBO(35, 157, 102, 0.4),
                        Color.fromRGBO(219, 122, 43, 0.4),
                      ],
                      stops: [
                        (prepTimeRatio - 0.05).clamp(0, 1),
                        (prepTimeRatio + 0.05).clamp(0, 1),
                      ],
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(14, 17, 24, 1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Container(
                      height: 18,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          colors: const [
                            Color.fromRGBO(35, 157, 102, 0.2),
                            Color.fromRGBO(219, 122, 43, 0.2),
                          ],
                          stops: [
                            (prepTimeRatio - 0.1).clamp(0, 1),
                            (prepTimeRatio + 0.1).clamp(0, 1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -3,
                  left: (constraints.maxWidth * elapsedTimeRatio).clamp(
                    3,
                    constraints.maxWidth - 3,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 3,
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: totalElapsedTime.inMinutes < prepTime
                          ? const Color.fromRGBO(35, 157, 102, 1)
                          : const Color.fromRGBO(219, 122, 43, 1),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class RecipeHistoryCard extends StatelessWidget {
  const RecipeHistoryCard({super.key, required this.recipeHistory});

  final RecipeHistory recipeHistory;

  @override
  Widget build(BuildContext context) {
    final recipe = recipeHistory.recipe;
    final summary = recipeHistory.summary;

    return GestureDetector(
      onTap: () => context.router.push(
        RecipeChallengeSummaryRoute(recipe: recipe, summary: summary),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color.fromRGBO(24, 27, 33, 1),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: recipe.imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 10,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(24, 27, 33, 0),
                              Color.fromRGBO(24, 27, 33, 0.7),
                              Color.fromRGBO(24, 27, 33, 1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    CustomText(
                      text: recipe.name,
                      nunito: true,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: TextColor.white,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    BlocSelector<UserCubit, UserState, Difficulty>(
                      selector: (state) => state.cookingLevel!,
                      builder: (context, cookingLevel) => Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          CustomText(
                            text: formatDuration(getTotalTimeTaken(summary)),
                            nunito: false,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: summaryStepTextColorGetter(
                              getAcceptanceMarginStatus(
                                getTotalTimeTaken(summary),
                                recipe.totalDuration,
                                getTotalAcceptanceMargin(
                                  summary,
                                  cookingLevel,
                                  recipe,
                                ),
                              ),
                            ),
                            timer: true,
                          ),
                          CustomText(
                            text: ' / ${formatDuration(recipe.totalDuration)}',
                            nunito: false,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: TextColor.grey,
                            timer: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => context.read<UserCubit>().onFavorite(recipe),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(43, 46, 51, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child:
                              BlocSelector<UserCubit, UserState, List<Recipe>>(
                                selector: (state) => state.favorites,
                                builder: (context, favorites) =>
                                    SvgPicture.asset(
                                      favorites.contains(recipe)
                                          ? 'assets/icons/heart_filled.svg'
                                          : 'assets/icons/heart_outline.svg',
                                      width: 16,
                                      height: 16,
                                    ),
                              ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: recipe.recipeType == RecipeType.meat
                            ? const Color.fromRGBO(215, 98, 97, 0.1)
                            : const Color.fromRGBO(74, 188, 150, 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: recipe.recipeType == RecipeType.meat
                            ? SvgPicture.asset(
                                'assets/icons/meat.svg',
                                width: 16,
                                height: 16,
                              )
                            : SvgPicture.asset(
                                'assets/icons/leaf.svg',
                                width: 16,
                                height: 16,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
