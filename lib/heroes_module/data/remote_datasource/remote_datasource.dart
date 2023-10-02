import 'entity/dto.dart';
import 'hero_service_rest.dart';

abstract class RemoteDataSource {
  Future<StatusResponse> fetchHero({ int limit=20, int length});
}

class RemoteDataSourceImpl extends RemoteDataSource {

  final HeroService service;

  RemoteDataSourceImpl({required this.service}): super();

  @override
  Future<StatusResponse> fetchHero({int limit = 20, int length = 0}) async {
    return await service.fetchHeroes(length: length);
  }
}