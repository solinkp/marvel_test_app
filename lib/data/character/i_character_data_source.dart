import 'package:marvel_test/models/character/character.dart';

abstract class ICharacterDataSource {
  Future<List<Character>> getCharacters(int offset);
}
