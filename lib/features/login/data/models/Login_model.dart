class LoginModel {
  final bool value;
  final Data? data; // Make 'data' nullable
  final int code;

  const LoginModel({
    required this.value,
    this.data, // Optional positional parameter for data
    required this.code,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        value: json['value'] as bool,
        data: json['data'] != null ? Data.fromJson(json['data']) : null, // Handle null data
        code: json['code'] as int,
      );
}

class Data {
  final bool isExist;

  const Data({required this.isExist});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isExist: json['is_exist'] as bool,
      );
}
