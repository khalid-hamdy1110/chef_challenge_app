import 'dart:async';

import 'package:chef_challenge_project/models/entities.dart';
import 'package:chef_challenge_project/states/challenge/challenge_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeCubit extends Cubit<ChallengeState> {
  ChallengeCubit() : super(ChallengeState.initial());

  Timer? _timer;

  void startTimer() {
    if (state.isRunning) return;

    emit(state.copyWith(isRunning: true));

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => emit(
        state.copyWith(
          elapsedTime: state.elapsedTime + const Duration(seconds: 1),
          totalElapsedTime: state.totalElapsedTime + const Duration(seconds: 1),
        ),
      ),
    );
  }

  void doneStep(
    AcceptanceMarginStatus marginStatus,
    Duration currentStepDuration,
    RecipeStep step,
  ) {
    if (!state.isRunning) return;

    final adjustedTotalElapsedTime = (state.elapsedTime < currentStepDuration)
        ? state.totalElapsedTime + currentStepDuration - state.elapsedTime
        : state.totalElapsedTime;

    emit(
      state.copyWith(
        isRunning: false,
        currentStepIndex: state.currentStepIndex + 1,
        elapsedTime: Duration.zero,
        totalElapsedTime: adjustedTotalElapsedTime,
        stepsSummary: List.from(state.stepsSummary)
          ..add(
            SummaryStep(
              step: step,
              timeTaken: state.elapsedTime,
              marginStatus: marginStatus,
              totalTimeTaken: state.totalElapsedTime,
            ),
          ),
      ),
    );
    _timer?.cancel();
    if (!state.isCompleted) startTimer();
  }

  void completeRecipe() {
    emit(state.copyWith(isCompleted: true));
  }

  void exitChallenge() {
    emit(state.copyWith(isCompleted: true));
    _timer?.cancel();
  }

  List<SummaryStep> getLatestSummary() {
    return state.stepsSummary;
  }
}
