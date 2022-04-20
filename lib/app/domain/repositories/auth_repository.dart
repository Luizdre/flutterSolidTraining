import 'package:solid/app/domain/entities/logged_user.dart';
import 'package:solid/app/domain/usecases/login_usecase.dart';

abstract class AuthRepository {
  Future<LoggedUser> login(CredentialsParams params);
}
