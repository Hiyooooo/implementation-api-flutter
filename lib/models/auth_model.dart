import 'dart:convert';

AuthModel loginModelFromJson(String str) =>
    AuthModel.fromJson(json.decode(str));

String loginModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  bool status;
  String message;
  String token;

  AuthModel({required this.status, required this.message, required this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
  };
}
