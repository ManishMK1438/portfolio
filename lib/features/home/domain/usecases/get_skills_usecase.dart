import 'package:portfolio/core/utils/typedef.dart';
import 'package:portfolio/features/home/home_exports.dart';

class GetSkillsUseCase implements UseCase<List<SkillsEntity>, NoParams> {
  final ProfileRepository _profileRepository;
  GetSkillsUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  ResultFuture<List<SkillsEntity>> call(NoParams params) async {
    return await _profileRepository.getSkills();
  }
}
