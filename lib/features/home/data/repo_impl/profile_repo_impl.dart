import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/data/datasource/supabase_data_source/supabase_data_source.dart';
import 'package:portfolio/features/home/home_exports.dart';

class ProfileRepoImpl implements ProfileRepository {
  final SupabaseDataSource _supabaseDataSource;

  ProfileRepoImpl({required SupabaseDataSource supabaseDataSource})
    : _supabaseDataSource = supabaseDataSource;

  @override
  ResultFuture<AboutMeEntity> getAboutMe() async {
    try {
      final response = await _supabaseDataSource.getAboutMe();
      return right(response);
    } catch (e) {
      return left(e as AppException);
    }
  }

  @override
  ResultFuture<List<SkillsEntity>> getSkills() async {
    try {
      final response = await _supabaseDataSource.getSkills();
      return right(response);
    } catch (e) {
      return left(e as AppException);
    }
  }
}
