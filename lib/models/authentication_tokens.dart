
import 'package:app/models/peripheral.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationTokens {

  String refreshToken;
  String accessToken;

  AuthenticationTokens({
    @required this.refreshToken,
    @required this.accessToken,
  });

  factory AuthenticationTokens.fromJson(Map<String, dynamic> map) {
    return AuthenticationTokens(
        refreshToken: map['refreshToken'] as String,
        accessToken: map['accessToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'refreshToken': refreshToken,
      'accessToken':accessToken,
    } as Map<String, dynamic>;
  }
}