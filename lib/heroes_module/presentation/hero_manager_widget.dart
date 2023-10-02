import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_heroes/widgets/hero_widget.dart';
import 'package:my_heroes/widgets/loading_widget.dart';
import 'controller/heroes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HeroManagerWidget extends StatelessWidget {

  final HeroesController controller = Modular.get<HeroesController>();
  final isLoading = Observable(false);

  HeroManagerWidget({super.key}) {
      controller.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) {
          if(controller.isLoading) return const LoadingWidget();
          return HeroGridWidget (
            heroes: controller.heroesList,
            refreshData: (data) => controller.updateData(),
          );
        }
    );
  }
}
