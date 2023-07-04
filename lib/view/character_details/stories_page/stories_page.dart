import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
import 'package:marvel_test/view/character_details/stories_page/widgets/story_item.dart';
import 'package:marvel_test/view_model/character_detail/story_vm/story_view_model.dart';

final _storyProvider = Provider.autoDispose(
  (ref) => ref.watch(storiesProvider),
);

class StoriesPage extends ConsumerStatefulWidget {
  final int characterId;

  const StoriesPage({super.key, required this.characterId});

  @override
  ConsumerState<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends ConsumerState<StoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(storiesProvider.notifier).getStoryList(
            charId: widget.characterId,
            offset: 0,
            refresh: true,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final storyList = ref.watch(_storyProvider);

    return RefreshIndicator(
      onRefresh: () => _loadData(0, refresh: true),
      child: storyList.isLoading ||
              (!storyList.isLoading &&
                  storyList.failure == null &&
                  storyList.response == null)
          ? const CustomLoader(size: SpinnerSize.normal)
          : storyList.failure != null || storyList.response!.isEmpty
              ? const EmptyData()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  itemCount: storyList.response!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (_, index) {
                    if (index < storyList.response!.length) {
                      var story = storyList.response![index];
                      return StoryItem(story: story);
                    } else {
                      return const CustomLoader(size: SpinnerSize.small);
                    }
                  },
                ),
    );
  }

  Future<void> _loadData(int offset, {bool refresh = false}) async {
    ref.read(storiesProvider.notifier).getStoryList(
          charId: widget.characterId,
          offset: offset,
          refresh: refresh,
        );
  }
}
