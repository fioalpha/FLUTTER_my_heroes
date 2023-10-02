import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_heroes/heroes_module/data/hero_repository.dart';
import 'package:my_heroes/heroes_module/data/remote_datasource/hero_service_rest.dart';

import '../data/remote_datasource/remote_datasource.dart';
import '../domain/usecase/hero_use_case.dart';
import '../presentation/controller/heroes_controller.dart';

class HeroesModule extends Module {

  @override
  void exportedBinds(i){
    i.add<HeroService>(HeroServiceImpl.new);
    i.add<RemoteDataSource>(RemoteDataSourceImpl.new);
    i.add<HeroRepository>(HeroRepositoryImpl.new);
    i.add(GetHeroUseCase.new);
    i.addSingleton(HeroesController.new);
  }

}