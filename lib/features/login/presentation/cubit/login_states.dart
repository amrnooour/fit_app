import 'package:fit_app/features/login/data/models/Login_model.dart';
import 'package:fit_app/features/login/data/models/code_model.dart';

class LoginStates {}

class LoginSuccess extends LoginStates {
  LoginModel loginModel;
  LoginSuccess(this.loginModel);
}

class LoginFailure extends LoginStates {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

class LoginLoading extends LoginStates {}

class LoginInitial extends LoginStates {}

class CodeSuccess extends LoginStates {
  CodeModel codeModel;
  CodeSuccess(this.codeModel);
}

class CodeFailure extends LoginStates {
  final String errorMessage;
  CodeFailure(this.errorMessage);
}

class CodeLoading extends LoginStates {}
class EnableButton extends LoginStates {}
class DisableButton extends LoginStates {}

