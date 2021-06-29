import 'package:butce/db/hiveDb.dart';
import 'package:butce/helper/api/dovizApi.dart';
import 'package:butce/helper/repository/bilgilerFirebaseRepo.dart';
import 'package:butce/helper/repository/bilgilerSqLiteRepo.dart';
import 'package:butce/service/prefService.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

// ihtiyacımız olan class’ları bir kere oluşturur ve çağırır (registerLazy).

void setupLocator() {
  locator.registerLazySingleton(() => PrefService());
  locator.registerLazySingleton(() => BilgilerSqLiteRepo());
  locator.registerLazySingleton(() => HiveDB());
  locator.registerLazySingleton(() => DovizApi());
  locator.registerLazySingleton(() => BilgilerFirebase());
}
