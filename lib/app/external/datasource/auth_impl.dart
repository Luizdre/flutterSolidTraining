import 'package:solid/app/domain/usecases/login_usecase.dart';
import 'package:solid/app/domain/entities/logged_user.dart';
import 'package:solid/app/infra/datasource/auth_datasource.dart';

class AuthImpl implements AuthDatasource {
  @override
  Future<LoggedUser> login(CredentialsParams params) async {
    //Aqui vai o dio, http
    return LoggedUser(email: 'andre@andre.com', name: 'Andre');
  }
}
