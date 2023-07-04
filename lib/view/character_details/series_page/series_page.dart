import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
import 'package:marvel_test/view/character_details/series_page/widgets/serie_item.dart';
import 'package:marvel_test/view_model/character_detail/serie_vm/serie_view_model.dart';

final _serieProvider = Provider.autoDispose(
  (ref) => ref.watch(seriesProvider),
);

class SeriesPage extends ConsumerStatefulWidget {
  final int characterId;

  const SeriesPage({super.key, required this.characterId});

  @override
  ConsumerState<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends ConsumerState<SeriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(seriesProvider.notifier).getSerieList(
            charId: widget.characterId,
            offset: 0,
            refresh: true,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final serieList = ref.watch(_serieProvider);

    return RefreshIndicator(
      onRefresh: () => _loadData(0, refresh: true),
      child: serieList.isLoading ||
              (!serieList.isLoading &&
                  serieList.failure == null &&
                  serieList.response == null)
          ? const CustomLoader(size: SpinnerSize.normal)
          : serieList.failure != null || serieList.response!.isEmpty
              ? const EmptyData()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  itemCount: serieList.response!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (_, index) {
                    if (index < serieList.response!.length) {
                      var serie = serieList.response![index];
                      return SerieItem(serie: serie);
                    } else {
                      return const CustomLoader(size: SpinnerSize.small);
                    }
                  },
                ),
    );
  }

  Future<void> _loadData(int offset, {bool refresh = false}) async {
    ref.read(seriesProvider.notifier).getSerieList(
          charId: widget.characterId,
          offset: offset,
          refresh: refresh,
        );
  }
}
