import 'package:portfolio/features/home/home_exports.dart';

class AboutMeModel extends AboutMeEntity {
  const AboutMeModel({
    required super.image,
    required super.bio,
    required super.degree,
    required super.university,
    required super.duration,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': this.image,
      'bio': this.bio,
      'degree': this.degree,
      'university': this.university,
      'duration': this.duration,
    };
  }

  factory AboutMeModel.fromJson(Map<String, dynamic> map) {
    return AboutMeModel(
      image: map['image'] as String,
      bio: map['bio'] as String,
      degree: map['degree'] as String,
      university: map['university'] as String,
      duration: map['duration'] as String,
    );
  }

  factory AboutMeModel.empty() {
    return const AboutMeModel(
      image: '',
      bio: '',
      degree: '',
      university: '',
      duration: '',
    );
  }
}
