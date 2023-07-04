import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  final int characterId;
  const EventsPage({super.key, required this.characterId});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}