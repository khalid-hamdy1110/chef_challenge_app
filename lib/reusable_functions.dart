import 'package:chef_challenge_project/models.dart';
import 'package:chef_challenge_project/widgets/custom_text.dart';

String formatDuration(Duration d) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  int minutes = d.inMinutes;
  int seconds = d.inSeconds % 60;
  return "$minutes:${twoDigits(seconds)}";
}

Duration getTotalTimeTaken(List<SummaryStep> summary) {
  Duration total = Duration.zero;
  for (final summaryStep in summary) {
    total += summaryStep.timeTaken;
  }
  return total;
}

Duration getTotalAcceptanceMargin(
  List<SummaryStep> summary,
  Difficulty cookingLevel,
  Recipe recipe,
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

AcceptanceMarginStatus getAcceptanceMarginStatus(
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

TextColor summaryStepTextColorGetter(AcceptanceMarginStatus marginStatus) {
  switch (marginStatus) {
    case AcceptanceMarginStatus.beforeMargin:
      return TextColor.green;
    case AcceptanceMarginStatus.withinMargin:
      return TextColor.orange;
    case AcceptanceMarginStatus.afterMargin:
      return TextColor.red;
  }
}
