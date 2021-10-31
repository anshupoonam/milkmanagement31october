
class RegisterRequestModel {
  String? userName;
  String? emailId;
  String? password;
  String? confirmPassword;

  RegisterRequestModel({
    this.userName,
    this.emailId,
    this.password,
    this.confirmPassword,
  });

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    emailId = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['email'] = emailId;
    data['password'] = password;
    return data;
  }
}

class RegisterResponseModel {
  int ?code;
  String ?message;
  String ? token;

  RegisterResponseModel({this.code, this.message,this.token});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] =message;
    data['token'] =message;
    return data;
  }
}