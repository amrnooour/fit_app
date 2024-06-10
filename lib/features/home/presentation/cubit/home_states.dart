import 'package:fit_app/features/home/data/models/home_model.dart';
import 'package:fit_app/features/home/data/models/success_stories_model.dart';

class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeBottomNav extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
}

class HomeFailure extends HomeStates {
  final String errorMessage;
  HomeFailure(this.errorMessage);
}

class StoresLoading extends HomeStates {}

class StoresSuccess extends HomeStates {
}

class StoresFailure extends HomeStates {
  final String errorMessage;
  StoresFailure(this.errorMessage);
}
