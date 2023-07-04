import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/di/injection.dart';
import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/repository/event/i_event_repository.dart';
import 'package:marvel_test/view_model/character_detail/event_vm/event_vm_state.dart';

final eventsProvider = StateNotifierProvider<EventViewModel, EventVmState>(
  (ref) => locator<EventViewModel>(),
);

@injectable
class EventViewModel extends StateNotifier<EventVmState> {
  final IEventRepository _repository;

  EventViewModel(this._repository) : super(EventVmState.initial());

  Future<void> getEventList({
    required int charId,
    required int offset,
    bool refresh = false,
  }) async {
    if (refresh) {
      state = EventVmState.loading();
    }
    try {
      var response = await _repository.getCharEvents(
        charId: charId,
        offset: offset,
      );

      if (response == null) {
        state = EventVmState.failure(S.current.generalError);
      } else {
        state = EventVmState.success([
          if (!refresh) ...state.response ?? [],
          ...response,
        ]);
      }
    } catch (e) {
      state = EventVmState.failure(S.current.generalError);
      rethrow;
    }
  }
}
