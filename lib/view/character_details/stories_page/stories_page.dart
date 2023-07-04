import 'package:flutter/material.dart';

class StoriesPage extends StatefulWidget {
  final int characterId;
  const StoriesPage({super.key, required this.characterId});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}