import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:chef_challenge_project/models/entities.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';
import 'package:chef_challenge_project/states/challenge/challenge_cubit.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:chef_challenge_project/states/challenge/challenge_state.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:chef_challenge_project/widgets/custom_button.dart';
import 'package:chef_challenge_project/widgets/custom_divider.dart';
import 'package:chef_challenge_project/widgets/custom_text.dart';
import 'package:chef_challenge_project/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chef_challenge_project/reusable_functions.dart';

@RoutePage()
class RecipeChallengeScreen extends StatelessWidget {
  const RecipeChallengeScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChallengeCubit()..startTimer(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(14, 17, 24, 1),
        appBar: _appBarBuilder(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocSelector<UserCubit, UserState, Difficulty>(
              selector: (state) => state.cookingLevel!,
              builder: (context, cookingLevel) {
                return BlocSelector<
                  ChallengeCubit,
                  ChallengeState,
                  ({
                    int currentStepIndex,
                    String elapsedTimeFormatted,
                    bool nextUp,
                    TextColor acceptanceMarginStatusColor,
                    Duration totalElapsedTime,
                    Duration elapsedTime,
                  })
                >(
                  selector: (state) {
                    final currentStepIndex = state.currentStepIndex.clamp(
                      0,
                      recipe.steps.length - 1,
                    );
                    TextColor acceptanceMarginStatusColor;
                    final acceptanceMarginStatus = _marginStatusGetter(
                      recipe.steps[currentStepIndex],
                      state.elapsedTime,
                      cookingLevel,
                    );

                    switch (acceptanceMarginStatus) {
                      case AcceptanceMarginStatus.beforeMargin:
                        acceptanceMarginStatusColor = TextColor.white;
                      case AcceptanceMarginStatus.withinMargin:
                        acceptanceMarginStatusColor = TextColor.orange;
                      case AcceptanceMarginStatus.afterMargin:
                        acceptanceMarginStatusColor = TextColor.red;
                    }

                    return (
                      currentStepIndex: currentStepIndex,
                      elapsedTimeFormatted: formatDuration(state.elapsedTime),
                      nextUp: currentStepIndex != recipe.steps.length - 1,
                      acceptanceMarginStatusColor: acceptanceMarginStatusColor,
                      totalElapsedTime: state.totalElapsedTime,
                      elapsedTime: state.elapsedTime,
                    );
                  },
                  builder: (context, data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _stepDisplaySection(data),
                        const SizedBox(height: 16),
                        _currentStepCard(data),
                        const CustomDivider(),
                        _timerSection(data),
                        const CustomDivider(),
                        if (data.nextUp) ...[
                          const CustomText(
                            text: 'Next Up',
                            nunito: false,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: TextColor.white,
                          ),
                          const SizedBox(height: 13),
                          _nextUpSection(data),
                          const CustomDivider(),
                        ],
                        const CustomText(
                          text: 'Timeline',
                          nunito: false,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: TextColor.white,
                        ),
                        const SizedBox(height: 8),
                        LiveTimelineBar(
                          prepTime: recipe.prepTime,
                          cookingTime: recipe.cookingTime,
                          totalDuration: recipe.totalDuration,
                          totalElapsedTime: data.totalElapsedTime,
                          currentStepDuration:
                              recipe.steps[data.currentStepIndex].duration,
                          elapsedTime: data.elapsedTime,
                        ),
                        const SizedBox(height: 64),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocSelector<UserCubit, UserState, Difficulty>(
          selector: (state) => state.cookingLevel!,
          builder: (context, cookingLevel) =>
              BlocSelector<
                ChallengeCubit,
                ChallengeState,
                ({
                  int currentStepIndex,
                  Duration elapsedTime,
                  bool nextUp,
                  List<SummaryStep> summary,
                })
              >(
                selector: (state) {
                  final currentStepIndex = state.currentStepIndex.clamp(
                    0,
                    recipe.steps.length - 1,
                  );

                  return (
                    currentStepIndex: currentStepIndex,
                    elapsedTime: state.elapsedTime,
                    nextUp: currentStepIndex != (recipe.steps.length - 1),
                    summary: state.stepsSummary,
                  );
                },
                builder: (context, data) {
                  return CustomButton(
                    label: data.nextUp
                        ? 'Done with this step'
                        : 'Complete Recipe!',
                    icon: SvgPicture.asset('assets/icons/check.svg'),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: () {
                      if (!data.nextUp) {
                        context.read<ChallengeCubit>().completeRecipe();
                      }

                      context.read<ChallengeCubit>().doneStep(
                        _marginStatusGetter(
                          recipe.steps[data.currentStepIndex],
                          data.elapsedTime,
                          cookingLevel,
                        ),
                        recipe.steps[data.currentStepIndex].duration,
                        recipe.steps[data.currentStepIndex],
                      );

                      if (!data.nextUp) {
                        context.read<UserCubit>().onDoneWithRecipe(
                          RecipeHistory(
                            recipe: recipe,
                            summary: context
                                .read<ChallengeCubit>()
                                .getLatestSummary(),
                          ),
                        );

                        context.router.push(
                          RecipeChallengeSummaryRoute(
                            recipe: recipe,
                            summary: context
                                .read<ChallengeCubit>()
                                .getLatestSummary(),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
        ),
      ),
    );
  }

  ShaderMask _nextUpSection(
    ({
      TextColor acceptanceMarginStatusColor,
      int currentStepIndex,
      Duration elapsedTime,
      String elapsedTimeFormatted,
      bool nextUp,
      Duration totalElapsedTime,
    })
    data,
  ) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromRGBO(14, 17, 24, 0), Color.fromRGBO(14, 17, 24, 1)],
      ).createShader(bounds),
      blendMode: BlendMode.darken, // try overlay/darken too
      child: StepCard(
        step: recipe.steps[data.currentStepIndex + 1],
        nextUp: true,
      ),
    );
  }

  Stack _timerSection(
    ({
      TextColor acceptanceMarginStatusColor,
      int currentStepIndex,
      Duration elapsedTime,
      String elapsedTimeFormatted,
      bool nextUp,
      Duration totalElapsedTime,
    })
    data,
  ) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CustomText(
                  text: data.elapsedTimeFormatted,
                  nunito: false,
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  color: data.acceptanceMarginStatusColor,
                  timer: true,
                ),
                const SizedBox(height: 36),
              ],
            ),
            const SizedBox(width: 25),
            Column(
              children: [
                const SizedBox(height: 36),
                CustomText(
                  text: formatDuration(
                    recipe.steps[data.currentStepIndex].duration,
                  ),
                  nunito: false,
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  color: TextColor.grey,
                  timer: true,
                ),
              ],
            ),
          ],
        ),
        Transform.rotate(
          angle: -139.65 * pi / 180,
          child: Container(
            width: 1,
            height: 79,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
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
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }

  StepCard _currentStepCard(
    ({
      TextColor acceptanceMarginStatusColor,
      int currentStepIndex,
      Duration elapsedTime,
      String elapsedTimeFormatted,
      bool nextUp,
      Duration totalElapsedTime,
    })
    data,
  ) => StepCard(step: recipe.steps[data.currentStepIndex]);

  Text _stepDisplaySection(
    ({
      TextColor acceptanceMarginStatusColor,
      int currentStepIndex,
      Duration elapsedTime,
      String elapsedTimeFormatted,
      bool nextUp,
      Duration totalElapsedTime,
    })
    data,
  ) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Step ',
            style: GoogleFonts.hedvigLettersSerif(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          WidgetSpan(
            child: CustomText(
              text: (data.currentStepIndex + 1).toString(),
              nunito: false,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: TextColor.white,
            ),
          ),
          TextSpan(
            text: '/',
            style: GoogleFonts.hedvigLettersSerif(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: CustomText(
              text: recipe.steps.length.toString(),
              nunito: false,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: TextColor.grey,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBarBuilder() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(24, 27, 33, 1),
      automaticallyImplyLeading: false,
      leading: Align(
        alignment: Alignment.centerRight,
        child: BlocSelector<ChallengeCubit, ChallengeState, ChallengeState>(
          selector: (state) => state,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<ChallengeCubit>().exitChallenge();
                context.router.pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(43, 46, 51, 1),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: BlurryContainer(
                  blur: 12,
                  color: const Color.fromRGBO(43, 46, 51, 0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  padding: const EdgeInsets.all(11),
                  child: SvgPicture.asset(
                    'assets/icons/back_arrow.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      title: CustomText(
        text: recipe.name,
        nunito: false,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: TextColor.white,
      ),
      centerTitle: true,
    );
  }

  AcceptanceMarginStatus _marginStatusGetter(
    RecipeStep step,
    Duration elapsedTime,
    Difficulty cookingLevel,
  ) {
    final acceptedMargin = Duration(
      milliseconds:
          (step.acceptableMarginDuration.inMilliseconds *
                  recipe.difficultyFactor(cookingLevel))
              .round(),
    );

    final totalAcceptableTime = step.duration + acceptedMargin;

    if (elapsedTime > totalAcceptableTime) {
      return AcceptanceMarginStatus.afterMargin;
    }
    if (elapsedTime > step.duration && elapsedTime <= totalAcceptableTime) {
      return AcceptanceMarginStatus.withinMargin;
    }

    return AcceptanceMarginStatus.beforeMargin;
  }
}
