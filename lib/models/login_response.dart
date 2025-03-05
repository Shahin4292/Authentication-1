class LoginResponse {
  final int error;
  final String msg;
  final LoginData data;

  LoginResponse({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json['error'],
      msg: json['msg'],
      data: LoginData.fromJson(json['data']),
    );
  }
}

class LoginData {
  final String token;

  LoginData({required this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'],
    );
  }
}
