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
class ArticlesLoading extends HomeStates {}

class ArticlesSuccess extends HomeStates {
}

class ArticlesFailure extends HomeStates {
  final String errorMessage;
  ArticlesFailure(this.errorMessage);
}
