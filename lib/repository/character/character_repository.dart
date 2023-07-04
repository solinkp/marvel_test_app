import 'package:injectable/injectable.dart';

import 'package:marvel_test/models/character/character.dart';
import 'package:marvel_test/repository/character/i_character_repository.dart';
import 'package:marvel_test/data/character/i_character_data_source.dart';

@LazySingleton(as: ICharacterRepository)
class CharacterRepository implements ICharacterRepository {
  final ICharacterDataSource _characterDataSource;

  CharacterRepository(this._characterDataSource);

  @override
  Future<List<Character>?> getCharacters({required int offset}) async {
    try {
      return await _characterDataSource.getCharacters(offset);
    } catch (e) {
      return null;
    }
  }
}
