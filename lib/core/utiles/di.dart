import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/data/local_preference.dart';

GetIt locator = GetIt.instance;

initDI() {
  //locator.registerLazySingleton<RegisterCubit>(() => RegisterCubit());

  locator.registerSingletonAsync<SharedPreferences>(() async {
    return SharedPreferences.getInstance();
  });

  locator.registerSingletonWithDependencies<LocalPreferences>(
          () => LocalPreferences(sharedPreferences: locator.get<SharedPreferences>()),
      dependsOn: [SharedPreferences]);
  // locator.registerSingletonWithDependencies<MazoonCubit>(
  //         () => MazoonCubit(),
  //     dependsOn: [LocalPreferences]);



}