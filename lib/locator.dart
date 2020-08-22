import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/app.dart';
// import 'package:myapp/src/services/auth_service.dart';
// import 'package:myapp/src/services/auth_implementation_service.dart';
import 'package:myapp/src/services/repository_service.dart';
import 'package:myapp/src/services/repository_implementation_service.dart';

GetIt locator = new GetIt();
void main() {
  locator.registerSingleton<RepositoryService>(
      new RepositoryImplementationService());
  // locator.registerSingleton<AuthService>(new AuthImplementationService());
  runApp(App());
}
