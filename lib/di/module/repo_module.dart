import 'package:flutter_bloc_rx_stream/data/repositories/user_repository.dart';

import 'di_module.dart';

class RepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton<UserRepository>(UserRepository(getIt.get()));
  }
}
