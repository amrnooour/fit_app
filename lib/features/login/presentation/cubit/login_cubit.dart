import 'package:fit_app/features/login/data/repos/login_repo.dart';
import 'package:fit_app/features/login/presentation/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  bool isEnable = false;

  loginPhone() async {
    emit(LoginLoading());
    final response = await loginRepo.loginPhone(phone: phone.text);
    response.fold((erroeMessage) => emit(LoginFailure(erroeMessage)),
        (success) => emit(LoginSuccess(success)));
  }

  loginCode() async {
    emit(CodeLoading());
    final response =
        await loginRepo.loginCode(phone: phone.text, code: code.text);
    response.fold((erroeMessage) => emit(CodeFailure(erroeMessage)),
        (success) => emit(CodeSuccess(success)));
  }

  changeEnableButton() {
    if (phone.text.isEmpty) {
      isEnable = false;
      emit(DisableButton());
    } else if (phone.text.isNotEmpty) {
      isEnable = true;
      emit(EnableButton());
    }
  }
}





 /*signIn() async {
    try {
      emit(LoginLoading());
      final response = await Dio().post(
          "https://staging.fitexpert.team/app/domains/auth/check-mobile",
          data: {
            "mobile": phone.text,
          });
      LoginModel loginModel = LoginModel.fromJson(response.data);
      emit(LoginSuccess(loginModel));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }*/