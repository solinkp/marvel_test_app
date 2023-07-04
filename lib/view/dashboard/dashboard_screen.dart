import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/utils/global_snackbar.dart';
import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
import 'package:marvel_test/view/layouts/dashboard_layout.dart';
import 'package:marvel_test/view/dashboard/widgets/character_item.dart';
import 'package:marvel_test/view_model/dashboard/dashboard_vm_state.dart';
import 'package:marvel_test/view_model/dashboard/dashboard_view_model.dart';

final _dashboardProvider = Provider.autoDispose(
  (ref) => ref.watch(dashboardViewProvider),
);

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final _scrollController = ScrollController();
  int loadedChars = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        _loadData(loadedChars);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characterList = ref.watch(_dashboardProvider);
    ref.listen<DashboardVmState>(_dashboardProvider, (_, state) async {
      if (state.failure != null) {
        showMsnSnackbar(state.failure!);
      }
      if (state.response != null) {
        loadedChars = state.response!.length;
      }
    });

    return DashboardLayout(
      body: RefreshIndicator(
        onRefresh: () => _loadData(0, refresh: true),
        child: characterList.isLoading
            ? const CustomLoader(size: SpinnerSize.normal)
            : characterList.failure != null || characterList.response!.isEmpty
                ? const EmptyData()
                : GridView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    itemCount: characterList.response!.length + 1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (_, index) {
                      if (index < characterList.response!.length) {
                        var character = characterList.response![index];
                        return CharacterItem(character: character);
                      } else {
                        return const CustomLoader(size: SpinnerSize.small);
                      }
                    },
                  ),
      ),
    );
  }

  Future<void> _loadData(int offset, {bool refresh = false}) async {
    ref.read(dashboardViewProvider.notifier).getCharacterList(
          offset,
          refresh: refresh,
        );
  }
}
