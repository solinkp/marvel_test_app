import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/di/injection.dart';
import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/repository/comic/i_comic_repository.dart';
import 'package:marvel_test/view_model/character_detail/comic_vm/comic_vm_state.dart';

final comicsProvider = StateNotifierProvider<ComicViewModel, ComicVmState>(
  (ref) => locator<ComicViewModel>(),
);

@injectable
class ComicViewModel extends StateNotifier<ComicVmState> {
  final IComicRepository _repository;

  ComicViewModel(this._repository) : super(ComicVmState.initial());

  Future<void> getComicList({
    required int charId,
    required int offset,
    bool refresh = false,
  }) async {
    if (refresh) {
      state = ComicVmState.loading();
    }
    try {
      var response = await _repository.getCharComics(
        charId: charId,
        offset: offset,
      );

      if (response == null) {
        state = ComicVmState.failure(S.current.generalError);
      } else {
        state = ComicVmState.success([
          if (!refresh) ...state.response ?? [],
          ...response,
        ]);
      }
    } catch (e) {
      state = ComicVmState.failure(S.current.generalError);
      rethrow;
    }
  }
}
