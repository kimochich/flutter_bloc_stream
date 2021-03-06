import 'package:flutter/material.dart';
import 'package:flutter_bloc_rx_stream/base/base_event.dart';
import 'package:flutter_bloc_rx_stream/base/base_state.dart';
import 'package:flutter_bloc_rx_stream/data/models/response/user_response.dart';
import 'package:flutter_bloc_rx_stream/data/repositories/user_repository.dart';
import 'package:flutter_bloc_rx_stream/presentation/home_page/bloc/home_page_event.dart';
import '../../../base/base_bloc.dart';

part 'home_page_state.dart';

class HomePageBloc extends BaseBloc<HomePageEvent,HomePageState> with ChangeNotifier {
  UserRepository userRepository;

  UserResponse? _userData;

  UserResponse? get userData => _userData;

  // final BehaviorSubject<HomePageState> _userStream =
  //     BehaviorSubject<HomePageState>.seeded(HomePageInitial());
  //
  // Stream<HomePageState> get userStreamStream => _userStream.stream;
  //
  // Sink<HomePageState> get userStreamSink => _userStream.sink;

  HomePageBloc({required this.userRepository})  {
    event.add(GetUserDataEvent());
  }

  getListUser() async {
    loadingSink.add(true);
    final response = await userRepository.getListUser("hai");
    if (response.response.statusCode == 200) {
      _userData = response.data;
      state.add(GetUserSuccess(_userData!));
    } else {
      state.add(GetUserError("Call lỗi"));
    }
    loadingSink.add(false);
  }

  @override
   dispatchEvent(BaseEvent event) {
    if (event is GetUserDataEvent) {
      getListUser();
    }
  }
}
