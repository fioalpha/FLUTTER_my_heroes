import 'package:mobx/mobx.dart';
import 'package:my_heroes/data/hero_repository.dart';
import 'package:my_heroes/widgets/hero_widget.dart';

import '../../data/remote_datasource/remote_datasource.dart';
import '../../domain/hero.dart';
import '../../domain/usecase/hero_use_case.dart';

part 'heroes_controller.g.dart';

class HeroesController = _HeroesController with _$HeroesController;

abstract class _HeroesController with Store {
   GetHeroUseCase getHeroUseCase = GetHeroUseCase(
       repository: HeroRepositoryImpl(
           HeroServiceFactory.createRemoteDataSource()
       )
   );

   @observable
   ObservableList<HeroModel> heroesList = ObservableList();

  @observable
  ObservableFuture<List<HeroModel>> heroes = ObservableFuture.value([]);

  @action
  Future fetchHeroes() => heroes = ObservableFuture(
      getHeroUseCase.execute(0)
  ).then((value) => toModel(value));

  @action
  void updateData() {
    ObservableFuture(
        getHeroUseCase.execute(heroesList.length)
    ).then((value) =>
        heroesList.addAll(toModel(value))
    );
  }


  List<HeroModel> toModel(List<Hero> data) {
    print("Data recebido $data");
    return data.map((hero) => HeroModel(hero.image, hero.name))
        .toList();
  }
}

