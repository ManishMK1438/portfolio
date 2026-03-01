part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  // About Me Domain
  final ProfileStatus aboutMeStatus;
  final AboutMeEntity aboutMe;
  final String aboutMeError;

  // Skills Domain
  final ProfileStatus skillsStatus;
  final List<SkillsEntity> skills;
  final String skillsError;

  const ProfileState({
    this.aboutMeStatus = ProfileStatus.initial,
    this.aboutMe = AboutMeEntity.empty,
    this.aboutMeError = "",
    this.skillsStatus = ProfileStatus.initial,
    this.skills = const [],
    this.skillsError = "",
  });

  ProfileState copyWith({
    ProfileStatus? aboutMeStatus,
    AboutMeEntity? aboutMe,
    String? aboutMeError,
    ProfileStatus? skillsStatus,
    List<SkillsEntity>? skills,
    String? skillsError,
  }) {
    return ProfileState(
      aboutMeStatus: aboutMeStatus ?? this.aboutMeStatus,
      aboutMe: aboutMe ?? this.aboutMe,
      aboutMeError: aboutMeError ?? this.aboutMeError,
      skillsStatus: skillsStatus ?? this.skillsStatus,
      skills: skills ?? this.skills,
      skillsError: skillsError ?? this.skillsError,
    );
  }

  @override
  List<Object?> get props => [
    aboutMeStatus,
    aboutMe,
    aboutMeError,
    skillsStatus,
    skills,
    skillsError,
  ];
}
