import 'package:my_heroes/data/remote_datasource/hero_service_rest.dart';

import 'entity/dto.dart';

abstract class RemoteDataSource {
  Future<StatusResponse> fetchHero({ int limit=20, int length});
}

class RemoteDataSourceImpl extends RemoteDataSource {

  HeroService service;

  RemoteDataSourceImpl(this.service): super();

  @override
  Future<StatusResponse> fetchHero({int limit = 20, int length = 0}) async {
    return await service.fetchHeroes(length: length);
  }}

class HeroServiceFactory {

  static RemoteDataSource createRemoteDataSource() {
    return RemoteDataSourceImpl(HeroServiceImpl.create());
  }
}