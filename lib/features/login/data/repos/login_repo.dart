import 'package:dartz/dartz.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/login/data/models/login_model.dart';
import 'package:fit_app/features/login/data/models/code_model.dart';

class LoginRepo {
  final DioConsumer dioConsumer;
  LoginRepo({required this.dioConsumer});

  Future<Either<String, LoginModel>> loginPhone({required String phone}) async {
    try {
      final response = await dioConsumer
          .post(Constants.checkMobile, data: {Constants.mobile: phone});
      final user = LoginModel.fromJson(response);
      return right(user);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, CodeModel>> loginCode(
      {required String phone, required String code}) async {
    try {
      final response = await dioConsumer.post(Constants.inputCode,
          data: {Constants.mobile: phone, Constants.code: code});
      final user = CodeModel.fromJson(response);
      final decodedToken = user.data!.token;
      final name = user.data!.name;
      final mobile = user.data!.mobile;
      final yourCode = user.data!.code;
      final image = user.data!.image;



      CacheHelper().saveData(key: Constants.token, value: decodedToken);
      CacheHelper().saveData(key: "name", value: name);
      CacheHelper().saveData(key: "imageLogin", value: image);
      CacheHelper().saveData(key: "phone", value: mobile);
      CacheHelper().saveData(key: "code", value: yourCode);

      return right(user);
    } catch (e) {
      return left(e.toString());
    }
  }
}
