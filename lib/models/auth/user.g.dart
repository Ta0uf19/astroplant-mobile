// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['username'] as String,
    json['displayName'] as String,
    json['emailAddress'] as String,
    json['useEmailAddressForGravatar'] as bool,
    json['gravatarAlternative'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'displayName': instance.displayName,
      'emailAddress': instance.emailAddress,
      'useEmailAddressForGravatar': instance.useEmailAddressForGravatar,
      'gravatarAlternative': instance.gravatarAlternative,
    };
