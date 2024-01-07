import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/home_local_data_source.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repos/home_repositry_impl.dart';
import 'api_services.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton(HomeRepositryImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource:
          HomeRemoteDataSourceImepl(getIt.get<ApiServices>())));
}
