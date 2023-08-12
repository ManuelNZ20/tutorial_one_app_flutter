// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tutorial_one_app/domain/entities/tutorial.dart';
// import 'package:tutorial_one_app/infrastructure/datasources/tutorial_datasource_impl.dart';
// import 'package:tutorial_one_app/infrastructure/repositories/tutorial_repository_impl.dart';

// final indicator = StateProvider((ref) => 0);

// final tutorialNotifierProvider = StateNotifierProvider<TutorialNotifier,TutorialRepositoryImpl>((ref)=>TutorialNotifier(LocalDataSourceTutorial()));

// class TutorialNotifier extends StateNotifier<TutorialRepositoryImpl> {
//   final LocalDataSourceTutorial tutorialDataSource;
//   final List<Tutorial> pageTutorial = [];
//   TutorialNotifier(this.tutorialDataSource):super(
//     TutorialRepositoryImpl(
//     tutorialDataSource: tutorialDataSource
//   ));

//   Future<void> addLandingPageTutorial() async {
//     final List<Tutorial> listPage = await tutorialDataSource.getLandingPageTutorial();
//     pageTutorial.addAll(listPage);
//   }

// }

// final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
//   (ref) => ThemeNotifier(),
// );//para mantener un estado, más elaboratdo

// // Controller o Notifier, mantiene un estado en particular
// class ThemeNotifier extends StateNotifier<AppTheme>{
//   //STATE = Estado = new AppTheme();
//   ThemeNotifier():super(AppTheme());//crea una instancia de AppTheme

//   void toggleDarkmode() {
//     state = state.copyWith(
//       isDarkmode: !state.isDarkmode
//     );
//   }

//   void changeColorIndex(int colorIndex) {
//     state = state.copyWith(selectedColor: colorIndex);
//   }
// }

import 'package:flutter/material.dart';

class IndicatorProvider extends ChangeNotifier {
  // int _indicator = 0;
  Color color = const Color.fromARGB(255, 212, 227, 252);

  void toggleColor(bool condition) {
    if(condition) {
      color = Colors.blueAccent;
    }else {
      color = const Color.fromARGB(255, 212, 227, 252);
    }
    notifyListeners();
  }
}
