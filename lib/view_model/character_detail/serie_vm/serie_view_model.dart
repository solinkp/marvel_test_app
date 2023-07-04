import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/di/injection.dart';
import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/repository/serie/i_serie_repository.dart';
import 'package:marvel_test/view_model/character_detail/serie_vm/serie_vm_state.dart';

final seriesProvider = StateNotifierProvider<SerieViewModel, SerieVmState>(
  (ref) => locator<SerieViewModel>(),
);

@injectable
class SerieViewModel extends StateNotifier<SerieVmState> {
  final ISerieRepository _repository;

  SerieViewModel(this._repository) : super(SerieVmState.initial());

  Future<void> getSerieList({
    required int charId,
    required int offset,
    bool refresh = false,
  }) async {
    if (refresh) {
      state = SerieVmState.loading();
    }
    try {
      var response = await _repository.getCharSeries(
        charId: charId,
        offset: offset,
      );

      if (response == null) {
        state = SerieVmState.failure(S.current.generalError);
      } else {
        state = SerieVmState.success([
          if (!refresh) ...state.response ?? [],
          ...response,
        ]);
      }
    } catch (e) {
      state = SerieVmState.failure(S.current.generalError);
      rethrow;
    }
  }
}
