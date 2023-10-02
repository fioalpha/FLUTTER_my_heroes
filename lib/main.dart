import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_heroes/app_widget.dart';
import 'package:my_heroes/heroes_module/di/heroes_module.dart';
import 'package:my_heroes/heroes_module/presentation/hero_manager_widget.dart';

import 'app_module.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    )
  );
}
