import 'package:get_it/get_it.dart';
// import 'package:myapp/src/services/authentication_service.dart';
// import 'package:myapp/src/services/firestore_service.dart';
// import 'package:myapp/src/services/navigation_service.dart';
// import 'package:myapp/src/services/dialog_service.dart';
import 'package:myapp/src/services/cloud_storage_service.dart';
import 'package:myapp/src/utils/image_selector.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => DialogService());
  // locator.registerLazySingleton(() => AuthenticationService());
  // locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());
}
