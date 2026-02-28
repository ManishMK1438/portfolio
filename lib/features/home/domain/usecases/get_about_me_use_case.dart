import 'package:portfolio/core/utils/typedef.dart';
import 'package:portfolio/features/home/home_exports.dart';

class GetAboutMeUseCase implements UseCase<AboutMeEntity, NoParams> {
  final ProfileRepository _profileRepository;
  GetAboutMeUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  ResultFuture<AboutMeEntity> call(NoParams params) async {
    return await _profileRepository.getAboutMe();
  }
}
