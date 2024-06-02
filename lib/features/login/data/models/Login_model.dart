class LoginModel {
  bool? value;
  Data? data;
  int? code;

  LoginModel({this.value, this.data, this.code});

  LoginModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  bool? isExist;

  Data({this.isExist});

  Data.fromJson(Map<String, dynamic> json) {
    isExist = json['is_exist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_exist'] = this.isExist;
    return data;
  }
}