class LogoutResponse {
  final int error;
  final String msg;
  final String data;

  LogoutResponse({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(
      error: json['error'],
      msg: json['msg'],
      data: json['data'],
    );
  }
}
