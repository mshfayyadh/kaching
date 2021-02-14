import 'package:ka_ching/screens/viewmodel/addScreen_viewmodel.dart';
import 'package:ka_ching/screens/viewmodel/prev_rec_viewmodel.dart';
import 'package:ka_ching/screens/viewmodel/profile_viewmodel.dart';
import 'package:ka_ching/services/i&e_service.dart';
import 'package:ka_ching/services/profile_service.dart';
import 'package:ka_ching/services/rest_service.dart';
import 'package:get_it/get_it.dart';

GetIt dependency = GetIt.instance;

void init() {
  //services
  dependency.registerLazySingleton(() => ProfileService());
  dependency.registerLazySingleton(() => IEService());
  dependency.registerLazySingleton(() => RestService());

  //viewmodel
  dependency.registerLazySingleton(() => ProfileViewModel());
  dependency.registerLazySingleton(() => PrevViewModel());
  dependency.registerLazySingleton(() => AddScreenViewModel());
}