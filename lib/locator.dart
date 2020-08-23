import 'package:get_it/get_it.dart';
// import 'package:myapp/src/services/auth_service.dart';
// import 'package:myapp/src/services/auth_implementation_service.dart';
// import 'package:myapp/src/services/repository_service.dart';
import 'package:myapp/src/services/repository_implementation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerFactory(() => RepositoryService());
  locator.registerLazySingleton(() => RepositoryImplementationService());
  // locator.registerSingleton<AuthService>(new AuthImplementationService());
}
