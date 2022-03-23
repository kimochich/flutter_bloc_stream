import 'package:flutter/material.dart';
import 'package:flutter_bloc_rx_stream/page_routes.dart';
import 'package:flutter_bloc_rx_stream/di/injection/injection.dart';
import 'package:flutter_bloc_rx_stream/presentation/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_bloc_rx_stream/presentation/home_page/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'di/module/di_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injection.inject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _pageMap(),
      initialRoute: PageRoutes.home,
    );
  }

  _pageMap() {
    return <String, WidgetBuilder>{
      PageRoutes.home: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (_) => HomePageBloc(userRepo: getIt.get()),
          child: const HomePage(),
        );
      },
    };
  }
}
