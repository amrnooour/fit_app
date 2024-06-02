class CodeModel {
  bool? value;
  Data? data;
  int? code;

  CodeModel({this.value, this.data, this.code});

  CodeModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? mobile;
  String? secondMobile;
  String? mobileCountry;
  String? secondMobileCountry;
  String? email;
  String? countryCode;
  String? secondCountryCode;
  String? code;
  String? dob;
  String? gender;
  String? religion;
  String? username;
  String? image;
  String? clientInvitationCode;
  String? status;
  List<Packages>? packages;
  Null? settings;
  String? token;
  String? firebaseTopic;

  Data(
      {this.id,
      this.name,
      this.mobile,
      this.secondMobile,
      this.mobileCountry,
      this.secondMobileCountry,
      this.email,
      this.countryCode,
      this.secondCountryCode,
      this.code,
      this.dob,
      this.gender,
      this.religion,
      this.username,
      this.image,
      this.clientInvitationCode,
      this.status,
      this.packages,
      this.settings,
      this.token,
      this.firebaseTopic});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    secondMobile = json['second_mobile'];
    mobileCountry = json['mobile_country'];
    secondMobileCountry = json['second_mobile_country'];
    email = json['email'];
    countryCode = json['country_code'];
    secondCountryCode = json['second_country_code'];
    code = json['code'];
    dob = json['dob'];
    gender = json['gender'];
    religion = json['religion'];
    username = json['username'];
    image = json['image'];
    clientInvitationCode = json['client_invitation_code'];
    status = json['status'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
    settings = json['settings'];
    token = json['token'];
    firebaseTopic = json['firebase_topic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['second_mobile'] = this.secondMobile;
    data['mobile_country'] = this.mobileCountry;
    data['second_mobile_country'] = this.secondMobileCountry;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['second_country_code'] = this.secondCountryCode;
    data['code'] = this.code;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['username'] = this.username;
    data['image'] = this.image;
    data['client_invitation_code'] = this.clientInvitationCode;
    data['status'] = this.status;
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    data['settings'] = this.settings;
    data['token'] = this.token;
    data['firebase_topic'] = this.firebaseTopic;
    return data;
  }
}

class Packages {
  int? id;
  String? status;
  Null? statusNote;
  String? paidAmount;
  String? startAt;
  String? expireAt;
  String? startAtText;
  String? expireAtText;
  int? remainingDays;

  Packages(
      {this.id,
      this.status,
      this.statusNote,
      this.paidAmount,
      this.startAt,
      this.expireAt,
      this.startAtText,
      this.expireAtText,
      this.remainingDays});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    statusNote = json['status_note'];
    paidAmount = json['paid_amount'];
    startAt = json['start_at'];
    expireAt = json['expire_at'];
    startAtText = json['start_at_text'];
    expireAtText = json['expire_at_text'];
    remainingDays = json['remaining_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['status_note'] = this.statusNote;
    data['paid_amount'] = this.paidAmount;
    data['start_at'] = this.startAt;
    data['expire_at'] = this.expireAt;
    data['start_at_text'] = this.startAtText;
    data['expire_at_text'] = this.expireAtText;
    data['remaining_days'] = this.remainingDays;
    return data;
  }
}