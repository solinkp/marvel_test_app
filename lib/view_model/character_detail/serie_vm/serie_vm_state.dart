import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marvel_test/models/serie/state_response/serie_state_response.dart';

part 'serie_vm_state.freezed.dart';

@freezed
class SerieVmState with _$SerieVmState {
  const factory SerieVmState({
    required SerieStateResponse? response,
    required bool isLoading,
    required String? failure,
  }) = _SerieVmState;

  factory SerieVmState.initial() => const SerieVmState(
        response: null,
        isLoading: false,
        failure: null,
      );

  factory SerieVmState.loading() => const SerieVmState(
        response: null,
        isLoading: true,
        failure: null,
      );

  factory SerieVmState.success(SerieStateResponse data) => SerieVmState(
        response: data,
        isLoading: false,
        failure: null,
      );

  factory SerieVmState.failure(String data) => SerieVmState(
        response: null,
        isLoading: false,
        failure: data,
      );
}
