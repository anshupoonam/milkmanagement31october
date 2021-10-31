 class LoginRequestModel {
  String? loginName;
  String? loginPassword;

  LoginRequestModel({this.loginName, this.loginPassword});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    loginName = json['login_name'];
    loginPassword = json['login_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login_name'] = loginName;
    data['login_password'] = loginPassword;
    // print(data);
    return data;
  }
}

class LoginResponseModel {
  String? token;

  LoginResponseModel({this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
