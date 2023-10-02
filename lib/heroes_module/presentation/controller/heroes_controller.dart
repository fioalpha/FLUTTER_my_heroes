import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_heroes/widgets/hero_widget.dart';

import '../../domain/hero.dart';
import '../../domain/usecase/hero_use_case.dart';

part 'heroes_controller.g.dart';

class HeroesController = _HeroesController with _$HeroesController;

abstract class _HeroesController with Store {

    GetHeroUseCase useCase = Modular.get<GetHeroUseCase>();

    @observable
    List<HeroModel> heroesList = [];

    @observable
    ObservableFuture<List<HeroModel>> heroes = ObservableFuture.value([]);

    @observable
    bool isLoading = false;

    @action
    void updateData() {
      isLoading = true;
      ObservableFuture(
          useCase.execute(heroesList.length)
      ).then((value) {
        heroesList.addAll(toModel(value));
        isLoading = false;
      });
    }

    List<HeroModel> toModel(List<Hero> data) {
      return data.map((hero) => HeroModel(hero.image, hero.name))
          .toList();
    }
}
