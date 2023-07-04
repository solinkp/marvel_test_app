import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/utils/global_snackbar.dart';
import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
import 'package:marvel_test/view/wigdets/custom_gridview.dart';
import 'package:marvel_test/view_model/character_detail/serie_vm/serie_vm_state.dart';
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
  final _scrollController = ScrollController();
  int _loadedSeries = 0;
  int _plusLoad = 1;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.position.pixels &&
          _plusLoad > 0) {
        _loadData(_loadedSeries);
      }
    });
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serieList = ref.watch(_serieProvider);
    ref.listen<SerieVmState>(_serieProvider, (_, state) async {
      if (state.failure != null) {
        showMsnSnackbar(state.failure!);
      }
      if (state.response != null) {
        if (_loadedSeries == state.response!.series.length ||
            state.response!.series.length < 20 ||
            state.response!.fullyLoaded) {
          setState(() => _plusLoad = 0);
        } else {
          _loadedSeries = state.response!.series.length;
        }
      }
    });

    return RefreshIndicator(
      onRefresh: () => _loadData(0, refresh: true),
      child: serieList.isLoading ||
              (!serieList.isLoading &&
                  serieList.failure == null &&
                  serieList.response == null)
          ? const CustomLoader(size: SpinnerSize.normal)
          : serieList.failure != null || serieList.response!.series.isEmpty
              ? const EmptyData()
              : CustomGridview(
                  controller: _scrollController,
                  itemCount: serieList.response!.series.length + _plusLoad,
                  itemLength: serieList.response!.series.length,
                  builder: (index) {
                    var serie = serieList.response!.series[index];
                    return SerieItem(serie: serie);
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
