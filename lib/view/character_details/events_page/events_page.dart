import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
import 'package:marvel_test/view/character_details/events_page/widgets/event_item.dart';
import 'package:marvel_test/view_model/character_detail/event_vm/event_view_model.dart';

final _eventProvider = Provider.autoDispose(
  (ref) => ref.watch(eventsProvider),
);

class EventsPage extends ConsumerStatefulWidget {
  final int characterId;

  const EventsPage({super.key, required this.characterId});

  @override
  ConsumerState<EventsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends ConsumerState<EventsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventsProvider.notifier).getEventList(
            charId: widget.characterId,
            offset: 0,
            refresh: true,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventList = ref.watch(_eventProvider);

    return RefreshIndicator(
      onRefresh: () => _loadData(0, refresh: true),
      child: eventList.isLoading ||
              (!eventList.isLoading &&
                  eventList.failure == null &&
                  eventList.response == null)
          ? const CustomLoader(size: SpinnerSize.normal)
          : eventList.failure != null || eventList.response!.isEmpty
              ? const EmptyData()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  itemCount: eventList.response!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (_, index) {
                    if (index < eventList.response!.length) {
                      var event = eventList.response![index];
                      return EventItem(event: event);
                    } else {
                      return const CustomLoader(size: SpinnerSize.small);
                    }
                  },
                ),
    );
  }

  Future<void> _loadData(int offset, {bool refresh = false}) async {
    ref.read(eventsProvider.notifier).getEventList(
          charId: widget.characterId,
          offset: offset,
          refresh: refresh,
        );
  }
}
