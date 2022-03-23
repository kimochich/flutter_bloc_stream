
import 'package:flutter_bloc_rx_stream/data/data_source/remote/dio_helper.dart';
import 'package:flutter_bloc_rx_stream/data/data_source/remote/res_client.dart';


import 'di_module.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    // register api
    getIt.registerSingleton(RestClient(DioHelper.dioObject));
  }

}
