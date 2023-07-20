import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/models.dart';
import '../../screens/screens.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Criar conta"),
                  Icon(
                    Icons.app_registration,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ));
            },
          )
        ],
      ),
      body: ScopedModelDescendant<User>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Form(
              key: _globalKey,
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "E-mail",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text!.isEmpty || !text!.contains("@")) {
                        return "E-mail inválido!";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Senha",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (text) {
                      if (text!.isEmpty || text.length < 6) {
                        return "Senha inválida!";
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {},
                      child: const Text("Esqueci minha senha"),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          model.signIn();
                        }
                      },
                      child: const Text("Entrar"),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          LinearBorder.bottom(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
