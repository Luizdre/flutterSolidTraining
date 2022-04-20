import 'package:flutter_modular/flutter_modular.dart';
import 'package:solid/app/modules/auth/auth_store.dart';

import 'auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const AuthPage()),
  ];
}
