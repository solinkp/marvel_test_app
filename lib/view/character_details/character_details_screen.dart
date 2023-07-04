import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:marvel_test/models/character/character.dart';
import 'package:marvel_test/view/layouts/details_layout.dart';
import 'package:marvel_test/view/character_details/widgets/detail_header.dart';
import 'package:marvel_test/view/character_details/comics_page/comics_page.dart';
import 'package:marvel_test/view/character_details/events_page/events_page.dart';
import 'package:marvel_test/view/character_details/series_page/series_page.dart';
import 'package:marvel_test/view/character_details/stories_page/stories_page.dart';

@RoutePage()
class CharacterDetailsScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  var _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ComicsPage(characterId: widget.character.id),
      EventsPage(characterId: widget.character.id),
      SeriesPage(characterId: widget.character.id),
      StoriesPage(characterId: widget.character.id),
    ];

    return DetailsLayout(
      title: widget.character.name,
      detailHeader: DetailHeader(character: widget.character),
      body: pages[_currentPageIndex],
      pageIndex: _currentPageIndex,
      onDestinationSelected: _onDestinationSelected,
    );
  }

  void _onDestinationSelected(int index) {
    setState(() => _currentPageIndex = index);
  }
}
