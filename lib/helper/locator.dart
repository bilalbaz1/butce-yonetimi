import 'package:butce/db/hiveDb.dart';
import 'package:butce/helper/repository/bilgilerSqLiteRepo.dart';
import 'package:butce/service/prefService.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PrefService());
  locator.registerLazySingleton(() => BilgilerSqLiteRepo());
  locator.registerLazySingleton(() => HiveDB());
}
