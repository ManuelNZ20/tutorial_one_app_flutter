import 'package:tutorial_one_app/domain/entities/tutorial.dart';

abstract class TutorialDataSource {
  Future<List<Tutorial>> getLandingPageTutorial();
}