

import 'package:my_heroes/heroes_module/data/remote_datasource/entity/dto.dart';
import 'package:my_heroes/heroes_module/data/remote_datasource/remote_datasource.dart';

import '../domain/hero.dart';

abstract class HeroRepository {
  Future<List<Hero>> fetchListHero(int length);
}

class HeroRepositoryImpl implements HeroRepository {

  final RemoteDataSource remoteDataSource;
  HeroRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Hero>> fetchListHero(int length) async {
    var result = await remoteDataSource.fetchHero(length: length);
    return result.data
        .results
        .map((data) {
            final HeroResponse response = data as HeroResponse;
            return Hero(
                image: '${response.thumbnail.path}.${response.thumbnail.extension}',
                name: response.name
            );
        }
    ).toList();
  }

}