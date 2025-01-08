class UserModel {
  int? statusCode;
  bool? success;
  Data? data;
  String? message;

  UserModel({this.statusCode, this.success, this.data, this.message});

  UserModel.fromJson(json) {
    statusCode = json['status_code'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? userID;
  String? type;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? birthDate;
  String? cityID;
  String? token;
  String? firebaseToken;
  String? loginType;
  String? socialID;
  String? loged;
  String? gender;
  String? lastUpdatedUsers;
  String? createdAtUser;
  String? mainRate;
  String? totalRates;
  String? ratesNumber;
  String? teacherCompleteProfile;
  String? profile;
  String? iSTEACHER;
  String? blocked;
  String? lastUpdated;
  String? createdUsersAt;

  Data(
      {this.userID,
      this.type,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.birthDate,
      this.cityID,
      this.token,
      this.firebaseToken,
      this.loginType,
      this.socialID,
      this.loged,
      this.gender,
      this.lastUpdatedUsers,
      this.createdAtUser,
      this.mainRate,
      this.totalRates,
      this.ratesNumber,
      this.teacherCompleteProfile,
      this.profile,
      this.iSTEACHER,
      this.blocked,
      this.lastUpdated,
      this.createdUsersAt});

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    type = json['Type'];
    name = json['Name'];
    phone = json['Phone'];
    email = json['Email'];
    password = json['Password'];
    birthDate = json['BirthDate'];
    cityID = json['CityID'];
    token = json['Token'];
    firebaseToken = json['FirebaseToken'];
    loginType = json['LoginType'];
    socialID = json['SocialID'];
    loged = json['loged'];
    gender = json['Gender'];
    lastUpdatedUsers = json['lastUpdatedUsers'];
    createdAtUser = json['CreatedAtUser'];
    mainRate = json['MainRate'];
    totalRates = json['TotalRates'];
    ratesNumber = json['RatesNumber'];
    teacherCompleteProfile = json['TeacherCompleteProfile'];
    profile = json['Profile'];
    iSTEACHER = json['ISTEACHER'];
    blocked = json['Blocked'];
    lastUpdated = json['lastUpdated'];
    createdUsersAt = json['CreatedUsersAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['Type'] = this.type;
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['BirthDate'] = this.birthDate;
    data['CityID'] = this.cityID;
    data['Token'] = this.token;
    data['FirebaseToken'] = this.firebaseToken;
    data['LoginType'] = this.loginType;
    data['SocialID'] = this.socialID;
    data['loged'] = this.loged;
    data['Gender'] = this.gender;
    data['lastUpdatedUsers'] = this.lastUpdatedUsers;
    data['CreatedAtUser'] = this.createdAtUser;
    data['MainRate'] = this.mainRate;
    data['TotalRates'] = this.totalRates;
    data['RatesNumber'] = this.ratesNumber;
    data['TeacherCompleteProfile'] = this.teacherCompleteProfile;
    data['Profile'] = this.profile;
    data['ISTEACHER'] = this.iSTEACHER;
    data['Blocked'] = this.blocked;
    data['lastUpdated'] = this.lastUpdated;
    data['CreatedUsersAt'] = this.createdUsersAt;
    return data;
  }
}
