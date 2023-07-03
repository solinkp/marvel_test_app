import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:marvel_test/res/constants/url.dart';
import 'package:marvel_test/models/character/character.dart';
import 'package:marvel_test/data/character/i_character_data_source.dart';

@LazySingleton(as: ICharacterDataSource)
class CharacterDataSource implements ICharacterDataSource {
  final Dio client;

  CharacterDataSource({required this.client});

  @override
  Future<List<Character>> getCharacters() async {
    final response = await client.get(baseUrl);

    List<Character> characters = [];
    for (var character in response.data['data']['results']) {
      characters.add(Character.fromJson(character));
    }
    return characters;
  }
}
