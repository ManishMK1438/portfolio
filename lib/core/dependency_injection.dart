import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/data/datasource/supabase_data_source/supabase_data_source.dart';
import 'package:portfolio/features/home/data/repo_impl/profile_repo_impl.dart';

import '../features/home/home_exports.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton(() => Supabase.instance.client);

  _initSupabase();
}

void _initSupabase() {
  //datasource
  serviceLocator
    ..registerLazySingleton<SupabaseDataSource>(
      () => SupabaseDataSourceImpl(supabaseClient: serviceLocator()),
    )
    //repository
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepoImpl(supabaseDataSource: serviceLocator()),
    )
    ..registerLazySingleton<GetSkillsUseCase>(
      () => GetSkillsUseCase(profileRepository: serviceLocator()),
    )
    ..registerLazySingleton<GetAboutMeUseCase>(
      () => GetAboutMeUseCase(profileRepository: serviceLocator()),
    )
    ..registerFactory<ProfileBloc>(
      () => ProfileBloc(
        getAboutMe: serviceLocator(),
        getSkills: serviceLocator(),
      ),
    );
}
