import 'package:tutorial_one_app/domain/datasources/tutorial_datasource.dart';
import 'package:tutorial_one_app/domain/entities/tutorial.dart';
import 'package:tutorial_one_app/domain/repositories/tutorial_repository.dart';

class TutorialRepositoryImpl extends TutorialRepository {
  final TutorialDataSource tutorialDataSource;

  TutorialRepositoryImpl({required this.tutorialDataSource});
  @override
  Future<List<Tutorial>> getLandingPageTutorial() {
    return tutorialDataSource.getLandingPageTutorial();
  }

}