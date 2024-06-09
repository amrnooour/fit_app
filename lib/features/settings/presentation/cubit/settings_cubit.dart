import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/features/settings/data/repos/settings_repo.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsRepo settingsRepo;
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());

  XFile? profilePic;
  TextEditingController name = TextEditingController();
  bool isEnable = false;
  String editedName = "";
  String image = "";

  uploadProfileImage(XFile image) {
    profilePic = image;
    emit(UploadImage());
  }

  updateInfo() async {
    emit(SettingsLoading());
    final response = await settingsRepo.updateProfile(
        name: name.text, profilePic: profilePic);
    response.fold((error) => emit(SettingsFailure(errorMessage: error)),
        (success) {
      emit(SettingsSuccess());
      editedName = success.data.name;
      image = success.data.image;
      CacheHelper().saveData(key: "image", value: image);
      CacheHelper().saveData(key: "editedName", value: editedName);
      name.text = "";
      isEnable = false;
    });
  }

  enableButton() {
    if (name.text.isNotEmpty) {
      isEnable = true;
    } else {
      isEnable = false;
    }
    emit(SettingsEnable());
  }

  /*updateInfo() async {
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
  }*/
}
