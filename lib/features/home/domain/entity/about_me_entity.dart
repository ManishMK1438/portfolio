import 'package:equatable/equatable.dart';

class AboutMeEntity extends Equatable {
  final String image;
  final String bio, degree, university, duration;

  const AboutMeEntity({
    required this.image,
    required this.bio,
    required this.degree,
    required this.university,
    required this.duration,
  });

  @override
  List<Object?> get props => [image, bio, degree, university, duration];

  static const empty = AboutMeEntity(
    image: '',
    bio: '',
    degree: '',
    university: '',
    duration: '',
  );
}
