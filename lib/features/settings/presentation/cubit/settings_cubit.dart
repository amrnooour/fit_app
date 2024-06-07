import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/functions/upload_image_to_api.dart';
import 'package:fit_app/features/settings/data/models/update_model.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  Dio dio;
  SettingsCubit(this.dio) : super(SettingsInitial());

  XFile? profilePic;
  TextEditingController name = TextEditingController();

  uploadProfileImage(XFile image) {
    profilePic = image;
    emit(UploadImage());
  }

  /*updateInfo() async {
    emit(SettingsLoading());
    final response = await settingsRepo.updateProfile(
        name: name.text, /*profilePic: profilePic!*/);
    response.fold((error) => emit(SettingsFailure(errorMessage: error)),
        (success) => emit(SettingsSuccess(updateModel: success)));
  }*/
  updateInfo() async {
    var image = await uploadImageToAPI(profilePic!);
    var formData =
        FormData.fromMap({"name": name.text, "_method": "put", "image": image});
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer 6376|6sibOdL2ijrshLhraJAizd5rpG1izBbID6LODoAr",
      "Content-Type": "multipart/form-data"
    };
    try {
      emit(SettingsLoading());
      final response = await dio.post(
          "https://staging.fitexpert.team/app/domains/auth/update-profile",
          data: formData,
          options: Options(headers: headers));
      final update = UpdateModel.fromJson(response.data);
      final photo = update.data.image;
      CacheHelper().saveData(key: "image", value: photo);
      emit(SettingsSuccess(updateModel: update));
    } catch (e) {
      emit(SettingsFailure(errorMessage: e.toString()));
    }
  }
}
