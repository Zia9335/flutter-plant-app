import 'package:get_it/get_it.dart';
import 'package:w3/core/services/auth_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(AuthService());
}
