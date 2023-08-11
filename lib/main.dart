import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_one_app/config/theme/app_theme.dart';
import 'package:tutorial_one_app/infrastructure/datasources/tutorial_datasource_impl.dart';
import 'package:tutorial_one_app/infrastructure/repositories/tutorial_repository_impl.dart';
import 'package:tutorial_one_app/presentation/providers/tutorial_provider.dart';
import 'package:tutorial_one_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tutorialRepositoryImpl =
        TutorialRepositoryImpl(tutorialDataSource: LocalDataSourceTutorial());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                TutorialProvider(tutorialRepository: tutorialRepositoryImpl)
                  ..addLandingPageTutorial())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().themeData(),
          home: const HomeScreen()),
    );
  }
}
