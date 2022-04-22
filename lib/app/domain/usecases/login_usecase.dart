import 'package:solid/app/domain/entities/logged_user.dart';
import 'package:solid/app/domain/errors/errors.dart';
import 'package:solid/app/domain/repositories/auth_repository.dart';

abstract class ILoginUsecase {
  Future<LoggedUser> execute(CredentialsParams params);
}

class LoginUsecase implements ILoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);
  @override
  Future<LoggedUser> execute(CredentialsParams params) async {
    if (!params.email.contains('@')) {
      throw AuthException('E-mail invalido');
    }
    if (params.password.isEmpty) {
      throw AuthException('Senha invalida');
    }
    try {
      return await authRepository.login(params);
    } catch (e) {
      throw Exception('Erro no repository');
    }
  }
}

class CredentialsParams {
  String email;
  String password;

  CredentialsParams({required this.email, required this.password});
}
