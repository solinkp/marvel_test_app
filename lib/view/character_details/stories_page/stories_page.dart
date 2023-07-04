import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/utils/global_snackbar.dart';
import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
import 'package:marvel_test/view/character_details/stories_page/widgets/story_item.dart';
import 'package:marvel_test/view_model/character_detail/story_vm/story_view_model.dart';
import 'package:marvel_test/view_model/character_detail/story_vm/story_vm_state.dart';

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
  final _scrollController = ScrollController();
  int _loadedStories = 0;
  int _plusLoad = 1;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.position.pixels &&
          _plusLoad > 0) {
        _loadData(_loadedStories);
      }
    });
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storyList = ref.watch(_storyProvider);
    ref.listen<StoryVmState>(_storyProvider, (_, state) async {
      if (state.failure != null) {
        showMsnSnackbar(state.failure!);
      }
      if (state.response != null) {
        if (_loadedStories == state.response!.stories.length ||
            state.response!.stories.length < 20 ||
            state.response!.fullyLoaded) {
          setState(() => _plusLoad = 0);
        } else {
          _loadedStories = state.response!.stories.length;
        }
      }
    });

    return RefreshIndicator(
      onRefresh: () => _loadData(0, refresh: true),
      child: storyList.isLoading ||
              (!storyList.isLoading &&
                  storyList.failure == null &&
                  storyList.response == null)
          ? const CustomLoader(size: SpinnerSize.normal)
          : storyList.failure != null || storyList.response!.stories.isEmpty
              ? const EmptyData()
              : GridView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  itemCount: storyList.response!.stories.length + _plusLoad,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (_, index) {
                    if (index < storyList.response!.stories.length) {
                      var story = storyList.response!.stories[index];
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
