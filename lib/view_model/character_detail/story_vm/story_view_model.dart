import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/di/injection.dart';
import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/repository/story/i_story_repository.dart';
import 'package:marvel_test/view_model/character_detail/story_vm/story_vm_state.dart';

final storiesProvider = StateNotifierProvider<StoryViewModel, StoryVmState>(
  (ref) => locator<StoryViewModel>(),
);

@injectable
class StoryViewModel extends StateNotifier<StoryVmState> {
  final IStoryRepository _repository;

  StoryViewModel(this._repository) : super(StoryVmState.initial());

  Future<void> getStoryList({
    required int charId,
    required int offset,
    bool refresh = false,
  }) async {
    if (refresh) {
      state = StoryVmState.loading();
    }
    try {
      var response = await _repository.getCharStories(
        charId: charId,
        offset: offset,
      );

      if (response == null) {
        state = StoryVmState.failure(S.current.generalError);
      } else {
        state = StoryVmState.success([
          if (!refresh) ...state.response ?? [],
          ...response,
        ]);
      }
    } catch (e) {
      state = StoryVmState.failure(S.current.generalError);
      rethrow;
    }
  }
}
