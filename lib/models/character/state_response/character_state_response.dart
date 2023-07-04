import 'package:marvel_test/models/character/character.dart';

class CharacterStateResponse {
  final List<Character> characters;
  final bool fullyLoaded;

  CharacterStateResponse({
    required this.characters,
    required this.fullyLoaded,
  });
}
