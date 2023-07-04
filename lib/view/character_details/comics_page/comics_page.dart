import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(comicsProvider.notifier).getComicList(
            charId: 1011334,
            offset: 0,
            refresh: true,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final comicList = ref.watch(_comicProvider);

    return RefreshIndicator(
      onRefresh: () => _loadData(0, refresh: true),
      child: comicList.isLoading ||
              (!comicList.isLoading &&
                  comicList.failure == null &&
                  comicList.response == null)
          ? const CustomLoader(size: SpinnerSize.normal)
          : comicList.failure != null || comicList.response!.isEmpty
              ? const EmptyData()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  itemCount: comicList.response!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (_, index) {
                    if (index < comicList.response!.length) {
                      var comic = comicList.response![index];
                      return ComicItem(comic: comic);
                    } else {
                      return const CustomLoader(size: SpinnerSize.small);
                    }
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
