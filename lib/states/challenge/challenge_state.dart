import 'package:chef_challenge_project/models/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_state.freezed.dart';

@freezed
abstract class ChallengeState with _$ChallengeState {
  const factory ChallengeState({
    required int currentStepIndex,
    required Duration elapsedTime,
    required Duration totalElapsedTime,
    required bool isRunning,
    required bool isCompleted,
    required List<SummaryStep> stepsSummary,
  }) = _ChallengeState;

  factory ChallengeState.initial() {
    return const ChallengeState(
      currentStepIndex: 0,
      elapsedTime: Duration.zero,
      totalElapsedTime: Duration.zero,
      isRunning: false,
      stepsSummary: [],
      isCompleted: false,
    );
  }
}
