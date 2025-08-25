import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:chef_challenge_project/models.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:chef_challenge_project/widgets/custom_divider.dart';
import 'package:chef_challenge_project/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class RecipeChallengeSummaryScreen extends StatelessWidget {
  const RecipeChallengeSummaryScreen({
    super.key,
    required this.recipe,
    required this.summary,
  });

  final Recipe recipe;
  final List<SummaryStep> summary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Summary',
                nunito: false,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: TextColor.white,
              ),
              const SizedBox(height: 16),
              ...List.generate(summary.length, (index) {
                return SummaryStepCard(
                  step: summary[index].step,
                  summaryStep: summary[index],
                );
              }),
              const CustomDivider(),
              const SizedBox(height: 16),
              BlocSelector<UserCubit, UserState, Difficulty>(
                selector: (state) => state.cookingLevel!,
                builder: (context, cookingLevel) => TotalCard(
                  totalDuration: recipe.totalDuration,
                  totalTimeTaken: _getTotalTimeTaken(summary),
                  acceptanceMarginDuration: recipe.totalAcceptableMargin(
                    cookingLevel,
                  ),
                  acceptanceMarginStatus: _getAcceptanceMarginStatus(
                    _getTotalTimeTaken(summary),
                    recipe.totalDuration,
                    _getTotalAcceptanceMargin(summary, cookingLevel),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBarBuilder(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(24, 27, 33, 1),
      automaticallyImplyLeading: false,
      leading: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            context.router.popUntilRouteWithName(ExploreRoute.name);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(43, 46, 51, 1)),
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

  Duration _getTotalTimeTaken(List<SummaryStep> summary) {
    Duration total = Duration.zero;
    for (final summaryStep in summary) {
      total += summaryStep.timeTaken;
    }
    return total;
  }

  Duration _getTotalAcceptanceMargin(
    List<SummaryStep> summary,
    Difficulty cookingLevel,
  ) {
    Duration acceptedMargin = Duration.zero;

    for (final summaryStep in summary) {
      acceptedMargin += Duration(
        milliseconds:
            (summaryStep.step.acceptableMarginDuration.inMilliseconds *
                    recipe.difficultyFactor(cookingLevel))
                .round(),
      );
    }
    return acceptedMargin;
  }

  AcceptanceMarginStatus _getAcceptanceMarginStatus(
    Duration totalElapsedTime,
    Duration totalDuration,
    Duration acceptedMargin,
  ) {
    final totalAcceptableTime = totalDuration + acceptedMargin;

    if (totalElapsedTime > totalAcceptableTime) {
      return AcceptanceMarginStatus.afterMargin;
    }
    if (totalElapsedTime >= totalDuration &&
        totalElapsedTime <= totalAcceptableTime) {
      return AcceptanceMarginStatus.withinMargin;
    }

    return AcceptanceMarginStatus.beforeMargin;
  }
}

class SummaryStepCard extends StatelessWidget {
  const SummaryStepCard({
    super.key,
    required this.step,
    required this.summaryStep,
  });

  final RecipeStep step;
  final SummaryStep summaryStep;

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    int minutes = d.inMinutes;
    int seconds = d.inSeconds % 60;
    return "$minutes:${twoDigits(seconds)}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
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
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    CustomText(
                      text: _formatDuration(summaryStep.timeTaken),
                      nunito: false,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: _summaryStepTextColorGetter(
                        summaryStep.marginStatus,
                      ),
                      timer: true,
                    ),
                    CustomText(
                      text: ' / ${_formatDuration(step.duration)}',
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
        ],
      ),
    );
  }

  TextColor _summaryStepTextColorGetter(AcceptanceMarginStatus marginStatus) {
    switch (marginStatus) {
      case AcceptanceMarginStatus.beforeMargin:
        return TextColor.green;
      case AcceptanceMarginStatus.withinMargin:
        return TextColor.orange;
      case AcceptanceMarginStatus.afterMargin:
        return TextColor.red;
    }
  }
}

class TotalCard extends StatelessWidget {
  const TotalCard({
    super.key,
    required this.totalTimeTaken,
    required this.totalDuration,
    required this.acceptanceMarginStatus,
    required this.acceptanceMarginDuration,
  });

  final Duration totalDuration;
  final Duration totalTimeTaken;
  final Duration acceptanceMarginDuration;
  final AcceptanceMarginStatus acceptanceMarginStatus;

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    int minutes = d.inMinutes;
    int seconds = d.inSeconds % 60;
    return "$minutes:${twoDigits(seconds)}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 27, 33, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: CustomText(
                  text: 'Acceptance Margin',
                  nunito: true,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: TextColor.white,
                ),
              ),
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    CustomText(
                      text: _formatDuration(acceptanceMarginDuration),
                      nunito: false,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: TextColor.red,
                      timer: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: CustomText(
                  text: 'Total Time',
                  nunito: true,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: TextColor.white,
                ),
              ),
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    CustomText(
                      text: _formatDuration(totalTimeTaken),
                      nunito: false,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: _summaryStepTextColorGetter(
                        acceptanceMarginStatus,
                      ),
                      timer: true,
                    ),
                    CustomText(
                      text: ' / ${_formatDuration(totalDuration)}',
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
        ],
      ),
    );
  }

  TextColor _summaryStepTextColorGetter(AcceptanceMarginStatus marginStatus) {
    switch (marginStatus) {
      case AcceptanceMarginStatus.beforeMargin:
        return TextColor.green;
      case AcceptanceMarginStatus.withinMargin:
        return TextColor.orange;
      case AcceptanceMarginStatus.afterMargin:
        return TextColor.red;
    }
  }
}
