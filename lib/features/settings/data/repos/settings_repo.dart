import 'package:dartz/dartz.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/functions/upload_image_to_api.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/settings/data/models/update_model.dart';
import 'package:image_picker/image_picker.dart';

class SettingsRepo {
  DioConsumer dioConsumer;
  SettingsRepo({required this.dioConsumer});

  Future<Either<String, UpdateModel>> updateProfile(
      {required String name, XFile? profilePic}) async {
    String token = CacheHelper().getData(key: "token");

    //final uuid = await DeviceUuid().getUUID();
    try {
      final response = await dioConsumer
          .post(Constants.updateProfile, isFromData: true, data: profilePic==null?{
        "name": name,
        "_method": "put",
      }:
      {
        "name": name,
        "_method": "put",
        "image": await uploadImageToAPI(profilePic)
      }
      , headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data"
      });
      final user = UpdateModel.fromJson(response);

      print(response);
      return right(user);
    } catch (e) {
      return left(e.toString());
    }
  }
}
