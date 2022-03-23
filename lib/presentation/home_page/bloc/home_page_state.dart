part of 'home_page_bloc.dart';

abstract class HomePageState extends BaseState {
   HomePageState();
}

class Loading extends HomePageState {
  @override
  List<Object> get props => [];
}

class GetUserSuccess extends HomePageState {
  UserResponse userResponse;

  GetUserSuccess(this.userResponse);

  @override
  List<Object> get props => [];
}

class GetUserFaild extends HomePageState {

  @override
  List<Object> get props => [];
}
