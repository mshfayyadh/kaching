import 'package:ka_ching/screens/viewmodel/addScreen_viewmodel.dart';
import 'package:ka_ching/screens/viewmodel/prev_rec_viewmodel.dart';
import 'package:ka_ching/screens/viewmodel/register_viewmodel.dart';
import 'package:ka_ching/screens/viewmodel/update_viewmodel.dart';
import 'package:ka_ching/services/add_service.dart';
import 'package:ka_ching/services/prev_service.dart';
import 'package:ka_ching/services/register_service.dart';
import 'package:ka_ching/services/rest_service.dart';
import 'package:ka_ching/services/update_service.dart';
import 'package:get_it/get_it.dart';

GetIt dependency = GetIt.instance;

void init() {
  //services
  dependency.registerLazySingleton(() => AddService());
  dependency.registerLazySingleton(() => PastService());
  dependency.registerLazySingleton(() => RegisterService());
  dependency.registerLazySingleton(() => UpdateService());
  dependency.registerLazySingleton(() => RestService());

  //viewmodel
  dependency.registerLazySingleton(() => PrevViewModel());
  dependency.registerLazySingleton(() => RegisterViewModel());
  dependency.registerLazySingleton(() => UpdateViewModel());
  dependency.registerLazySingleton(() => AddScreenViewModel());
}