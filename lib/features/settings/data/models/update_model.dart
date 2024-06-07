class UpdateModel {
  final bool value;
  final Data data;
  final int code;

  UpdateModel({
    required this.value,
    required this.data,
    required this.code,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) {
    return UpdateModel(
      value: json['value'],
      data: Data.fromJson(json['data']),
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'data': data.toJson(),
      'code': code,
    };
  }
}

class Data {
  final int id;
  final String name;
  final String mobile;
  final String secondMobile;
  final String mobileCountry;
  final String secondMobileCountry;
  final String email;
  final String countryCode;
  final String secondCountryCode;
  final String code;
  final String dob;
  final String gender;
  final String religion;
  final String username;
  final String image;
  final String clientInvitationCode;
  final String status;
  final List<Package> packages;
  final dynamic settings;
  final String token;
  final String firebaseTopic;

  Data({
    required this.id,
    required this.name,
    required this.mobile,
    required this.secondMobile,
    required this.mobileCountry,
    required this.secondMobileCountry,
    required this.email,
    required this.countryCode,
    required this.secondCountryCode,
    required this.code,
    required this.dob,
    required this.gender,
    required this.religion,
    required this.username,
    required this.image,
    required this.clientInvitationCode,
    required this.status,
    required this.packages,
    this.settings,
    required this.token,
    required this.firebaseTopic,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var packagesList = json['packages'] as List;
    List<Package> packages =
        packagesList.map((i) => Package.fromJson(i)).toList();

    return Data(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      secondMobile: json['second_mobile'],
      mobileCountry: json['mobile_country'],
      secondMobileCountry: json['second_mobile_country'],
      email: json['email'],
      countryCode: json['country_code'],
      secondCountryCode: json['second_country_code'],
      code: json['code'],
      dob: json['dob'],
      gender: json['gender'],
      religion: json['religion'],
      username: json['username'],
      image: json['image'],
      clientInvitationCode: json['client_invitation_code'],
      status: json['status'],
      packages: packages,
      settings: json['settings'],
      token: json['token'],
      firebaseTopic: json['firebase_topic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'second_mobile': secondMobile,
      'mobile_country': mobileCountry,
      'second_mobile_country': secondMobileCountry,
      'email': email,
      'country_code': countryCode,
      'second_country_code': secondCountryCode,
      'code': code,
      'dob': dob,
      'gender': gender,
      'religion': religion,
      'username': username,
      'image': image,
      'client_invitation_code': clientInvitationCode,
      'status': status,
      'packages': packages.map((p) => p.toJson()).toList(),
      'settings': settings,
      'token': token,
      'firebase_topic': firebaseTopic,
    };
  }
}

class Package {
  final int id;
  final String status;
  final dynamic statusNote;
  final String paidAmount;
  final String startAt;
  final String expireAt;
  final String startAtText;
  final String expireAtText;
  final int remainingDays;

  Package({
    required this.id,
    required this.status,
    this.statusNote,
    required this.paidAmount,
    required this.startAt,
    required this.expireAt,
    required this.startAtText,
    required this.expireAtText,
    required this.remainingDays,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      status: json['status'],
      statusNote: json['status_note'],
      paidAmount: json['paid_amount'],
      startAt: json['start_at'],
      expireAt: json['expire_at'],
      startAtText: json['start_at_text'],
      expireAtText: json['expire_at_text'],
      remainingDays: json['remaining_days'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'status_note': statusNote,
      'paid_amount': paidAmount,
      'start_at': startAt,
      'expire_at': expireAt,
      'start_at_text': startAtText,
      'expire_at_text': expireAtText,
      'remaining_days': remainingDays,
    };
  }
}
