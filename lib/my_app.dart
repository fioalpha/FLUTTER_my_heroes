import 'package:flutter/material.dart';

import 'heroes_module/presentation/hero_manager_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('My Heroes'),
          ),
          body: HeroManagerWidget(),
        )
    );
  }
}