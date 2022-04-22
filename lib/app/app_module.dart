import 'package:flutter_modular/flutter_modular.dart';
import 'package:solid/app/domain/usecases/login_usecase.dart';
import 'package:solid/app/external/datasource/auth_impl.dart';
import 'package:solid/app/infra/repositories/auth_repository_impl.dart';
import 'package:solid/app/modules/auth/auth_module.dart';
import 'package:solid/app/modules/auth/auth_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => AuthStore(i.get())),
    Bind.factory((i) => LoginUsecase(i.get())),
    Bind.factory((i) => AuthRepositoryImpl(i.get())),
    Bind.factory((i) => AuthImpl())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
  ];
}
