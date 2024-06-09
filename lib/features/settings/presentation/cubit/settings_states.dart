import 'package:fit_app/features/settings/data/models/update_model.dart';

class SettingsStates {}

class SettingsInitial extends SettingsStates {}

class SettingsLoading extends SettingsStates {}

class SettingsSuccess extends SettingsStates {
}

class SettingsFailure extends SettingsStates {
  final String errorMessage;

  SettingsFailure({required this.errorMessage});
}

class UploadImage extends SettingsStates {}
class SettingsEnable extends SettingsStates {}

