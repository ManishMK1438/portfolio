import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

abstract class ProfileRepository {
  ResultFuture<List<SkillsEntity>> getSkills();
  ResultFuture<AboutMeEntity> getAboutMe();
}
