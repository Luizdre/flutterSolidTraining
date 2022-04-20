import 'package:solid/app/domain/entities/logged_user.dart';
import 'package:solid/app/domain/errors/errors.dart';
import 'package:solid/app/domain/repositories/auth_repository.dart';
import 'package:solid/app/domain/usecases/login_usecase.dart';
import 'package:solid/app/infra/datasource/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);
  @override
  Future<LoggedUser> login(CredentialsParams params) async {
    try {
      final user = await _authDatasource.login(params);
      return user;
    } on AuthException {
      throw AuthException('Erro de repository');
    }
  }
}
