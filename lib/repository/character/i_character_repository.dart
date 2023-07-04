import 'package:marvel_test/models/character/character.dart';

abstract class ICharacterRepository {
  Future<List<Character>?> getCharacters({required int offset});
}
