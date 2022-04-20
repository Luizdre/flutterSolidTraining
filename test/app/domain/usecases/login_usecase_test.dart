import 'package:flutter_test/flutter_test.dart';
import 'package:solid/app/domain/entities/logged_user.dart';
import 'package:solid/app/domain/errors/errors.dart';
import 'package:solid/app/domain/usecases/login_usecase.dart';

import '../../../mock/mocks.dart';

void main() {
  late LoginUsecase loginUsecase;
  setUp(() {
    loginUsecase = LoginUsecase(AuthRepositoryMock());
  });
  test('Deve efetuar login', () async {
    final loggedUser = await loginUsecase
        .execute(CredentialsParams(email: 'andre@andre.com', password: '123'));

    expect(loggedUser, isA<LoggedUser>());
    expect(loggedUser.name, 'Andre');
  });

  test('Deve retornar um AuthException', () async {
    final emailTest = loginUsecase
        .execute(CredentialsParams(email: 'andre', password: '123'));
    final passwordTest = loginUsecase
        .execute(CredentialsParams(email: 'andre@andre.com', password: ''));

    expect(() async => await emailTest, throwsA(isA<AuthException>()));
    expect(() async => await passwordTest, throwsA(isA<AuthException>()));
  });
}
