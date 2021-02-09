import 'package:app/di/injector_provider.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:app/repositories/users_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  var username = 'dtestdd';

  setupInjection();
  var userRepository = inject<UserRepository>();
  var authRepository = inject<AuthRepository>();

  /// Returns user's details
  test('Returns user s details',() async {
    var userInfo =  await userRepository.userDetails(username);
    expect(userInfo.username, username);
  });

  // Create  user test case
  test('Create  user & Returns user s details',() async {
    await authRepository.logout();

    await userRepository.createUser(username,username,username+'@gmail.com');

    var userInfo =  await userRepository.userDetails(username);
    expect(userInfo.username, username);
  });





}