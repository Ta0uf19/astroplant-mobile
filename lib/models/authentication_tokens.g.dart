// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationTokens _$AuthenticationTokensFromJson(Map<String, dynamic> json) {
  return AuthenticationTokens(
    refreshToken: json['refreshToken'] as String,
    accessToken: json['accessToken'] as String,
  );
}

Map<String, dynamic> _$AuthenticationTokensToJson(
        AuthenticationTokens instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
    };
