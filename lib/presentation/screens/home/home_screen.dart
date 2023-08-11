import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_one_app/presentation/providers/tutorial_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tutorialProvider = context.watch<TutorialProvider>();
    return Scaffold(
      body: SafeArea(
          child: PageView.builder(
        itemCount: tutorialProvider.pageTutorial.length,
        itemBuilder: (context, index) {
          final random = Random().nextInt(35*index+1).toInt();
          return Container(
            color: Color.fromARGB(random, random, random, random),
            child: Center(
              child: Text('Index: $index'),
            ),
          );
        },
      )),
    );
  }
}
