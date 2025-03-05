class PasswordChangeResponse {
  final int error;
  final String msg;
  final String data;

  PasswordChangeResponse({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory PasswordChangeResponse.fromJson(Map<String, dynamic> json) {
    return PasswordChangeResponse(
      error: json['error'],
      msg: json['msg'],
      data: json['data'],
    );
  }
}
