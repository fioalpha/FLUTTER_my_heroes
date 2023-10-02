import 'package:flutter_modular/flutter_modular.dart';

import 'heroes_module/di/heroes_module.dart';
import 'main.dart';
import 'my_app.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [
    HeroesModule(),
  ];

  @override
  void binds(Injector i) {

  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const  MyApp());
  }

}