import 'package:portfolio/core/exports/packages_export.dart';

class ProjectsEntity extends Equatable {
  final String title, description, playStore, appStore, image;
  final List<String> technologies;

  @override
  List<Object?> get props => [
    title,
    description,
    playStore,
    appStore,
    image,
    technologies,
  ];

  const ProjectsEntity({
    required this.title,
    required this.description,
    required this.playStore,
    required this.appStore,
    required this.image,
    required this.technologies,
  });
}
