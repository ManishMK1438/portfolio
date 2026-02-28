import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/data/models/about_me_model.dart';
import 'package:portfolio/features/home/data/models/skills_model.dart';

abstract class SupabaseDataSource {
  Future<List<SkillsModel>> getSkills();
  Future<AboutMeModel> getAboutMe();
}

class SupabaseDataSourceImpl implements SupabaseDataSource {
  final SupabaseClient _supabaseClient;

  SupabaseDataSourceImpl({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  @override
  Future<List<SkillsModel>> getSkills() async {
    try {
      final response = await _supabaseClient
          .from('skills')
          .select()
          .order('created_at', ascending: true);

      try {
        List<SkillsModel> skillsList = [];

        for (var json in response) {
          skillsList.add(SkillsModel.fromJson(json));
        }

        return skillsList;
      } catch (e) {
        throw ParsingException(e.toString());
      }
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      if (e is ParsingException) {
        rethrow;
      }

      throw UnknownException(e.toString());
    }
  }

  @override
  Future<AboutMeModel> getAboutMe() async {
    try {
      final response = await _supabaseClient
          .from('about_me')
          .select()
          .order('created_at', ascending: true);

      try {
        return AboutMeModel.fromJson(response.single);
      } catch (e) {
        throw ParsingException(e.toString());
      }
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      if (e is ParsingException) {
        rethrow;
      }

      throw UnknownException(e.toString());
    }
  }
}
