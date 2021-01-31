import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'authentication_tokens.g.dart';

@JsonSerializable()
class AuthenticationTokens {

  String refreshToken;
  String accessToken;

  AuthenticationTokens({
    @required this.refreshToken,
    @required this.accessToken,
  });

  factory AuthenticationTokens.fromJson(Map<String, dynamic> json) => _$AuthenticationTokensFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationTokensToJson(this);

  @override
  String toString() {
    return 'AuthenticationTokens{refreshToken: $refreshToken, accessToken: $accessToken}';
  }
}