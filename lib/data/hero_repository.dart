
import 'package:my_heroes/data/remote_datasource/entity/dto.dart';
import 'package:my_heroes/data/remote_datasource/remote_datasource.dart';

import '../domain/hero.dart';

abstract class HeroRepository {
  Future<List<Hero>> fetchListHero(int length);
}

class HeroRepositoryImpl implements HeroRepository {

  final RemoteDataSource remoteDataSource;
  HeroRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Hero>> fetchListHero(int length) async {
    var result = await remoteDataSource.fetchHero(length: length);
    return result.data
        .results
        .map((data) {
            final HeroResponse d = data as HeroResponse;
            return Hero(image: '${d.thumbnail.path}.${d.thumbnail.extension}', name: d.name);
        }
    ).toList();
  }

}