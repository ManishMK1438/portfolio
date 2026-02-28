import 'package:equatable/equatable.dart';

class AboutMeEntity extends Equatable {
  final String image;
  final String bio;

  const AboutMeEntity({required this.image, required this.bio});
  @override
  List<Object?> get props => [image, bio];
}
