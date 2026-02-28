import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

class SkillsModel extends SkillsEntity {
  const SkillsModel({
    required super.title,
    required super.skills,
    required super.icon,
    required super.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'icon': this.icon,
      'skills': this.skills,
      'color': this.color,
    };
  }

  factory SkillsModel.fromJson(Map<String, dynamic> map) {
    // Extract the title first so we can use it as a seed
    final String categoryTitle = map['title'] as String;
    return SkillsModel(
      title: categoryTitle,
      icon: HelperFunctions.generateConsistentIcon(categoryTitle),
      skills: map['skills'] as List<String>,
      color: HelperFunctions.generateConsistentColor(categoryTitle),
    );
  }
}
