import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/utils/global_snackbar.dart';
import 'package:marvel_test/view/wigdets/empty_data.dart';
import 'package:marvel_test/view/wigdets/custom_loader.dart';
import 'package:marvel_test/view/wigdets/custom_gridview.dart';
import 'package:marvel_test/view_model/character_detail/event_vm/event_vm_state.dart';
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
  final _scrollController = ScrollController();
  int _loadedEvents = 0;
  int _plusLoad = 1;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.position.pixels &&
          _plusLoad > 0) {
        _loadData(_loadedEvents);
      }
    });
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventList = ref.watch(_eventProvider);
    ref.listen<EventVmState>(_eventProvider, (_, state) async {
      if (state.failure != null) {
        showMsnSnackbar(state.failure!);
      }
      if (state.response != null) {
        if (_loadedEvents == state.response!.events.length ||
            state.response!.events.length < 20 ||
            state.response!.fullyLoaded) {
          setState(() => _plusLoad = 0);
        } else {
          _loadedEvents = state.response!.events.length;
        }
      }
    });

    return RefreshIndicator(
      onRefresh: () => _loadData(0, refresh: true),
      child: eventList.isLoading ||
              (!eventList.isLoading &&
                  eventList.failure == null &&
                  eventList.response == null)
          ? const CustomLoader(size: SpinnerSize.normal)
          : eventList.failure != null || eventList.response!.events.isEmpty
              ? const EmptyData()
              : CustomGridview(
                  controller: _scrollController,
                  itemCount: eventList.response!.events.length + _plusLoad,
                  itemLength: eventList.response!.events.length,
                  builder: (index) {
                    var event = eventList.response!.events[index];
                    return EventItem(event: event);
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
