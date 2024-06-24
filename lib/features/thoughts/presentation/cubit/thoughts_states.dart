class ThoughtsStates {}

class ThoughtsIntial extends ThoughtsStates {}

class ThoughtsLoading extends ThoughtsStates {}

class ThoughtsFailure extends ThoughtsStates {
  final String errorMessage;

  ThoughtsFailure({required this.errorMessage});

}

class ThoughtsSuccess extends ThoughtsStates {}
