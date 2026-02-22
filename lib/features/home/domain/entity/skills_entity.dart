import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/packages_export.dart';

class SkillsEntity extends Equatable {
  final String title;
  final IconData icon;
  final List<String> skills;

  @override
  List<Object?> get props => [title, skills, icon];

  const SkillsEntity({
    required this.title,
    required this.skills,
    required this.icon,
  });
}
