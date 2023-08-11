
import 'package:tutorial_one_app/domain/entities/tutorial.dart';

abstract class TutorialRepository {

  Future<List<Tutorial>> getLandingPageTutorial();
}