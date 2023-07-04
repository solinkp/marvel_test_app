import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marvel_test/models/story/story.dart';

part 'story_vm_state.freezed.dart';

@freezed
class StoryVmState with _$StoryVmState {
  const factory StoryVmState({
    required List<Story>? response,
    required bool isLoading,
    required String? failure,
  }) = _StoryVmState;

  factory StoryVmState.initial() => const StoryVmState(
        response: null,
        isLoading: false,
        failure: null,
      );

  factory StoryVmState.loading() => const StoryVmState(
        response: null,
        isLoading: true,
        failure: null,
      );

  factory StoryVmState.success(List<Story> data) => StoryVmState(
        response: data,
        isLoading: false,
        failure: null,
      );

  factory StoryVmState.failure(String data) => StoryVmState(
        response: null,
        isLoading: false,
        failure: data,
      );
}
