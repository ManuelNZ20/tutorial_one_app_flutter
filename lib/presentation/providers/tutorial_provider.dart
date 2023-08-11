import 'package:flutter/material.dart';
import 'package:tutorial_one_app/domain/entities/tutorial.dart';
import 'package:tutorial_one_app/domain/repositories/tutorial_repository.dart';

class TutorialProvider extends ChangeNotifier {

  final TutorialRepository tutorialRepository;
  final List<Tutorial> pageTutorial = [];
  TutorialProvider({required this.tutorialRepository});

  Future<void> addLandingPageTutorial() async {
    final List<Tutorial> listPage = await tutorialRepository.getLandingPageTutorial();
    pageTutorial.addAll(listPage);
    notifyListeners();
  }

}