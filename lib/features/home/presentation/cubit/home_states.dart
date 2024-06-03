import 'package:fit_app/features/home/data/models/home_model.dart';

class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeBottomNav extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  final HomeModel homeModel;
  HomeSuccess(this.homeModel);
}

class HomeFailure extends HomeStates {
  final String errorMessage;
  HomeFailure(this.errorMessage);
}
