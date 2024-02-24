import 'package:get_it/get_it.dart';
import 'package:notes_app/core/database/cache_helper.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(),
  );
}
