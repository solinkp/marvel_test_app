import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marvel_test/models/character/character.dart';

part 'dashboard_vm_state.freezed.dart';

@freezed
class DashboardVmState with _$DashboardVmState {
  const factory DashboardVmState({
    required List<Character>? response,
    required bool isLoading,
    required String? failure,
  }) = _DashboardVmState;

  factory DashboardVmState.initial() => const DashboardVmState(
        response: null,
        isLoading: false,
        failure: null,
      );

  factory DashboardVmState.loading() => const DashboardVmState(
        response: null,
        isLoading: true,
        failure: null,
      );

  factory DashboardVmState.success(List<Character> data) => DashboardVmState(
        response: data,
        isLoading: false,
        failure: null,
      );

  factory DashboardVmState.failure(String data) => DashboardVmState(
        response: null,
        isLoading: false,
        failure: data,
      );
}
