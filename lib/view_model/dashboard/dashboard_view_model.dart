import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/di/injection.dart';
import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/view_model/dashboard/dashboard_vm_state.dart';
import 'package:marvel_test/repository/character/i_character_repository.dart';

final dashboardViewProvider =
    StateNotifierProvider<DashboardViewModel, DashboardVmState>(
  (ref) => locator<DashboardViewModel>(),
);

@injectable
class DashboardViewModel extends StateNotifier<DashboardVmState> {
  final ICharacterRepository _repository;

  DashboardViewModel(this._repository) : super(DashboardVmState.initial()) {
    getCharacterList(0, refresh: true);
  }

  Future<void> getCharacterList(int offset, {bool refresh = false}) async {
    if (refresh) {
      state = DashboardVmState.loading();
    }
    try {
      var response = await _repository.getCharacters(offset: offset);

      if (response == null) {
        state = DashboardVmState.failure(S.current.generalError);
      } else {
        state = DashboardVmState.success([
          if (!refresh) ...state.response ?? [],
          ...response,
        ]);
      }
    } catch (e) {
      state = DashboardVmState.failure(S.current.generalError);
      rethrow;
    }
  }
}
