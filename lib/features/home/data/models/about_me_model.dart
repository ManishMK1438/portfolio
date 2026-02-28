import 'package:portfolio/features/home/home_exports.dart';

class AboutMeModel extends AboutMeEntity {
  const AboutMeModel({required super.image, required super.bio});

  Map<String, dynamic> toJson() {
    return {'image': this.image, 'bio': this.bio};
  }

  factory AboutMeModel.fromJson(Map<String, dynamic> map) {
    return AboutMeModel(
      image: map['image'] as String,
      bio: map['bio'] as String,
    );
  }
}
