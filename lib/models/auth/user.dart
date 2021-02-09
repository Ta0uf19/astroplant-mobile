import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String username;
  String displayName;
  String emailAddress;
  bool useEmailAddressForGravatar;
  String gravatarAlternative;
  String password;


  User(this.id, this.username, this.displayName, this.emailAddress, this.useEmailAddressForGravatar, this.gravatarAlternative);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, username: $username, displayName: $displayName, emailAddress: $emailAddress, useEmailAddressForGravatar: $useEmailAddressForGravatar, gravatarAlternative: $gravatarAlternative, password: $password}';
  }
}