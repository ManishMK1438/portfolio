//domain
export 'domain/entity/experience_entity.dart';
export 'domain/entity/projects_entity.dart';
export 'domain/entity/skills_entity.dart';
//presentation
export 'presentation/widgets/bio_section.dart';
export 'presentation/widgets/contact_card.dart';
export 'presentation/widgets/contact_me_section.dart';
export 'presentation/widgets/footer.dart';
export 'presentation/widgets/home_screen_mobile.dart';
export 'presentation/widgets/home_screen_tab.dart';
export 'presentation/widgets/home_screen_web.dart';
export 'presentation/widgets/intro_column.dart';
export 'presentation/widgets/myself_widget.dart';
export 'presentation/widgets/projects_section.dart';
export 'presentation/widgets/skills_section.dart';
export 'presentation/widgets/social_buttons.dart';

// features/home/home_exports.dart

// 1. Export the main entry point
//export 'presentation/screens/home_screen.dart';

// 2. Export the Business Logic (Bloc/Cubit)
//export 'presentation/logic/home_bloc.dart';

// 3. Export Domain Entities (so other features can use the data types)
//export 'domain/entities/home_data_entity.dart';

// 4. Export the Repository Interface (for Dependency Injection)
//export 'domain/repositories/home_repository.dart';

// NOTE: We do NOT export the 'data/' folder.
// Implementation details like 'home_repository_impl.dart' or 'home_api.dart'
// should stay hidden inside the feature.
