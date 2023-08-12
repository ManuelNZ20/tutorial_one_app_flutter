import 'package:tutorial_one_app/domain/datasources/tutorial_datasource.dart';
import 'package:tutorial_one_app/domain/entities/tutorial.dart';
import 'package:tutorial_one_app/infrastructure/models/tutorial_model.dart';
import 'package:tutorial_one_app/presentation/shared/data/data_page.dart';

class LocalDataSourceTutorial extends TutorialDataSource {
  @override
  Future<List<Tutorial>> getLandingPageTutorial() async{
    final List<Tutorial> listTutorial = dataPage
        .map((e) => TutorialModel.fromJson(e).toTutorialEntity())
        .toList();
    return listTutorial;
  }
}
