import 'package:solid/app/domain/entities/logged_user.dart';
import 'package:solid/app/domain/repositories/auth_repository.dart';
import 'package:solid/app/domain/usecases/login_usecase.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<LoggedUser> login(CredentialsParams params) async {
    return LoggedUser(email: 'andre@andre.com', name: 'Andre');
  }
}
