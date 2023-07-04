import 'package:flutter/material.dart';

import 'package:marvel_test/models/event/event.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      onTap: () => _displayMoreInfo(context),
      title: event.title,
      imageUrl: event.thumbnail?.getImageUrl,
    );
  }

  void _displayMoreInfo(BuildContext context) {
    // show bootom sheet
  }
}
