import 'package:mobx/mobx.dart';
import 'package:solid/app/domain/entities/logged_user.dart';
import 'package:solid/app/domain/usecases/login_usecase.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LoginUsecase _loginUsecase;

  AuthStoreBase(this._loginUsecase);

  @observable
  CredentialsParams params = CredentialsParams(email: '', password: '');

  @observable
  bool obscured = false;

  Future<LoggedUser> doLogin() async {
    LoggedUser logged = await _loginUsecase.execute(params);
    return logged;
  }

  @action
  turnObscure() {
    obscured = !obscured;
  }
}
