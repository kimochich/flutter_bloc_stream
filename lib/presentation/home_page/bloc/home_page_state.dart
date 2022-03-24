part of 'home_page_bloc.dart';

abstract class HomePageState extends BaseState {
  HomePageState();
}

class GetUserSuccess extends HomePageState {
  final UserResponse userResponse;

  GetUserSuccess(this.userResponse);

  @override
  List<Object> get props => [];
}

class GetUserError extends HomePageState {
  final String mess;

  GetUserError(this.mess);

  @override
  List<Object> get props => [];
}
