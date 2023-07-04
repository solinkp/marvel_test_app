import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marvel_test/models/event/state_response/event_state_response.dart';

part 'event_vm_state.freezed.dart';

@freezed
class EventVmState with _$EventVmState {
  const factory EventVmState({
    required EventStateResponse? response,
    required bool isLoading,
    required String? failure,
  }) = _EventVmState;

  factory EventVmState.initial() => const EventVmState(
        response: null,
        isLoading: false,
        failure: null,
      );

  factory EventVmState.loading() => const EventVmState(
        response: null,
        isLoading: true,
        failure: null,
      );

  factory EventVmState.success(EventStateResponse data) => EventVmState(
        response: data,
        isLoading: false,
        failure: null,
      );

  factory EventVmState.failure(String data) => EventVmState(
        response: null,
        isLoading: false,
        failure: data,
      );
}
