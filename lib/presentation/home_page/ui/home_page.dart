import 'package:flutter/material.dart';
import 'package:flutter_bloc_rx_stream/data/models/response/user_response.dart';
import 'package:flutter_bloc_rx_stream/presentation/home_page/bloc/home_page_event.dart';
import 'package:flutter_bloc_rx_stream/widgets/page_loading_overlay.dart';
import 'package:provider/provider.dart';

import '../bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomePageBloc>(context);
    return MaterialApp(
      home: Scaffold(
        body: PageLoadingOverlay(
          loadingStream: bloc.loadingStream,
          child: Stack(
            children: [
              StreamBuilder<HomePageState>(
                stream: bloc.stateStream,
                builder: (BuildContext context, state) {
                  if (state.hasData && state.data is GetUserSuccess) {
                    UserResponse data = (state.data as GetUserSuccess).userResponse;
                    return ListView.builder(
                        itemCount: data.items?.length ?? 0,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              bloc.event.add(GetUserDataEvent());
                            },
                            child:
                                ListTile(title: Text(data.items?[index].login ?? "")),
                          );
                        });
                  }
                  // return const Center(
                  //   child: CircularProgressIndicator(),
                  // );
                  return Container();
                },
              ),
              StreamBuilder<HomePageState>(
                stream: bloc.stateStream,
                builder: (BuildContext context, state) {
                  print("STATE LÀ ${state.data}");
                    return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
