import 'package:tutorial_one_app/domain/entities/tutorial.dart';

class TutorialModel {
  final String title;
  final String description;
  final String imgUrl;

  TutorialModel(
      {required this.title, required this.description, required this.imgUrl});

  factory TutorialModel.fromJson(Map<String, dynamic> json) => TutorialModel(
      title: json['title'],
      description: json['description'],
      imgUrl: json['imgUrl']);

  Tutorial toTutorialEntity() =>
      Tutorial(title: title, description: description, imgUrl: imgUrl);
}
