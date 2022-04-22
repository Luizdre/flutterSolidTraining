import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solid/app/domain/usecases/login_usecase.dart';
import 'package:solid/app/modules/auth/auth_store.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: 'exemplo@exemplo.com.br', labelText: 'Email'),
              onChanged: (value) => store.params.email = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Observer(
                builder: (_) => TextField(
                      decoration: InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: IconButton(
                              onPressed: store.turnObscure,
                              icon: Icon(store.obscured
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off_outlined))),
                      obscureText: store.obscured,
                      onChanged: (value) => store.params.password = value,
                    )),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.doLogin,
        child: const Icon(Icons.add),
      ),
    );
  }
}
