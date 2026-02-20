import 'package:portfolio/core/exports/packages_export.dart';

class ExperienceEntity extends Equatable {
  final String heading;
  final String title;
  final String company;
  final String duration;
  final String location;

  const ExperienceEntity({
    required this.heading,
    required this.title,
    required this.company,
    required this.duration,
    required this.location,
  });

  @override
  List<Object?> get props => [heading, title, company, duration, location];
}
