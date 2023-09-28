import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_heroes/widgets/hero_widget.dart';
import 'controller/heroes_controller.dart';

class HeroManagerWidget extends StatelessWidget {

  final HeroesController controller = HeroesController();

  HeroManagerWidget({super.key}) {
      controller.updateData();
  }

  @override
  Widget build(BuildContext context) {
    final stateRequest = controller.heroes;
    return Observer(
        builder: (_) {
          print("status ${stateRequest.status}");
          switch(stateRequest.status) {
            case FutureStatus.pending:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FutureStatus.fulfilled:
              print("filled ${controller.heroesList}");
              return HeroGridWidget(
                  heroes: controller.heroesList ?? [],
                  refreshData: (data) => controller.updateData(),
              );

            case FutureStatus.rejected:
              return const Center(
                child: Text("Houve algum error"),
              );
          }
        }
    );
  }
}
