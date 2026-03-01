part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetAboutMeEvent extends ProfileEvent {
  const GetAboutMeEvent();

  @override
  List<Object?> get props => [];
}

class GetSkillsEvent extends ProfileEvent {
  const GetSkillsEvent();

  @override
  List<Object?> get props => [];
}

class GetFullProfileEvent extends ProfileEvent {
  const GetFullProfileEvent();

  @override
  List<Object?> get props => [];
}
