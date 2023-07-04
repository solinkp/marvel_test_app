import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/utils/global_snackbar.dart';
import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
import 'package:marvel_test/view/wigdets/custom_gridview.dart';
import 'package:marvel_test/view_model/character_detail/comic_vm/comic_vm_state.dart';
import 'package:marvel_test/view/character_details/comics_page/widgets/comic_item.dart';
import 'package:marvel_test/view_model/character_detail/comic_vm/comic_view_model.dart';

final _comicProvider = Provider.autoDispose(
  (ref) => ref.watch(comicsProvider),
);

class ComicsPage extends ConsumerStatefulWidget {
  final int characterId;

  const ComicsPage({super.key, required this.characterId});

  @override
  ConsumerState<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends ConsumerState<ComicsPage> {
  final _scrollController = ScrollController();
  int _loadedComics = 0;
  int _plusLoad = 1;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.position.pixels &&
          _plusLoad > 0) {
        _loadData(_loadedComics);
      }
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(comicsProvider.notifier).getComicList(
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
    final comicList = ref.watch(_comicProvider);
    ref.listen<ComicVmState>(_comicProvider, (_, state) async {
      if (state.failure != null) {
        showMsnSnackbar(state.failure!);
      }
      if (state.response != null) {
        if (_loadedComics == state.response!.comics.length ||
            state.response!.comics.length < 20 ||
            state.response!.fullyLoaded) {
          setState(() => _plusLoad = 0);
        } else {
          _loadedComics = state.response!.comics.length;
        }
      }
    });

    return RefreshIndicator(
      onRefresh: () => _loadData(0, refresh: true),
      child: comicList.isLoading ||
              (!comicList.isLoading &&
                  comicList.failure == null &&
                  comicList.response == null)
          ? const CustomLoader(size: SpinnerSize.normal)
          : comicList.failure != null || comicList.response!.comics.isEmpty
              ? const EmptyData()
              : CustomGridview(
                  controller: _scrollController,
                  itemCount: comicList.response!.comics.length + _plusLoad,
                  itemLength: comicList.response!.comics.length,
                  builder: (index) {
                    var comic = comicList.response!.comics[index];
                    return ComicItem(comic: comic);
                  },
                ),
    );
  }

  Future<void> _loadData(int offset, {bool refresh = false}) async {
    ref.read(comicsProvider.notifier).getComicList(
          charId: widget.characterId,
          offset: offset,
          refresh: refresh,
        );
  }
}
