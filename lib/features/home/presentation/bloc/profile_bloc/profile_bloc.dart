import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/home_exports.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetAboutMeUseCase _getAboutMe;
  final GetSkillsUseCase _getSkills;

  ProfileBloc({
    required GetAboutMeUseCase getAboutMe,
    required GetSkillsUseCase getSkills,
  }) : _getAboutMe = getAboutMe,
       _getSkills = getSkills,
       super(const ProfileState()) {
    // Handling events separately for granular UI updates
    on<GetAboutMeEvent>(_onFetchAboutMe);
    on<GetSkillsEvent>(_onFetchSkills);
    // Shortcut to trigger both
    on<GetFullProfileEvent>((event, emit) {
      add(const GetAboutMeEvent());
      add(const GetSkillsEvent());
    });
  }

  Future<void> _onFetchAboutMe(
    GetAboutMeEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(aboutMeStatus: ProfileStatus.loading));

    final result = await _getAboutMe(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          aboutMeStatus: ProfileStatus.failure,
          aboutMeError: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(aboutMeStatus: ProfileStatus.success, aboutMe: data),
      ),
    );
  }

  Future<void> _onFetchSkills(
    GetSkillsEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(skillsStatus: ProfileStatus.loading));

    final result = await _getSkills(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          skillsStatus: ProfileStatus.failure,
          skillsError: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(skillsStatus: ProfileStatus.success, skills: data),
      ),
    );
  }
}
