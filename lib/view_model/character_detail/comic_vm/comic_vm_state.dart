import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marvel_test/models/comic/state_response/comic_state_response.dart';

part 'comic_vm_state.freezed.dart';

@freezed
class ComicVmState with _$ComicVmState {
  const factory ComicVmState({
    required ComicStateResponse? response,
    required bool isLoading,
    required String? failure,
  }) = _ComicVmState;

  factory ComicVmState.initial() => const ComicVmState(
        response: null,
        isLoading: false,
        failure: null,
      );

  factory ComicVmState.loading() => const ComicVmState(
        response: null,
        isLoading: true,
        failure: null,
      );

  factory ComicVmState.success(ComicStateResponse data) => ComicVmState(
        response: data,
        isLoading: false,
        failure: null,
      );

  factory ComicVmState.failure(String data) => ComicVmState(
        response: null,
        isLoading: false,
        failure: data,
      );
}
