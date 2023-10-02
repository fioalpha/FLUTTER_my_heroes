// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HeroesController on _HeroesController, Store {
  late final _$heroesListAtom =
      Atom(name: '_HeroesController.heroesList', context: context);

  @override
  List<HeroModel> get heroesList {
    _$heroesListAtom.reportRead();
    return super.heroesList;
  }

  @override
  set heroesList(List<HeroModel> value) {
    _$heroesListAtom.reportWrite(value, super.heroesList, () {
      super.heroesList = value;
    });
  }

  late final _$heroesAtom =
      Atom(name: '_HeroesController.heroes', context: context);

  @override
  ObservableFuture<List<HeroModel>> get heroes {
    _$heroesAtom.reportRead();
    return super.heroes;
  }

  @override
  set heroes(ObservableFuture<List<HeroModel>> value) {
    _$heroesAtom.reportWrite(value, super.heroes, () {
      super.heroes = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HeroesController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_HeroesControllerActionController =
      ActionController(name: '_HeroesController', context: context);

  @override
  void updateData() {
    final _$actionInfo = _$_HeroesControllerActionController.startAction(
        name: '_HeroesController.updateData');
    try {
      return super.updateData();
    } finally {
      _$_HeroesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heroesList: ${heroesList},
heroes: ${heroes},
isLoading: ${isLoading}
    ''';
  }
}
