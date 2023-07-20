import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Nome completo",
                border: OutlineInputBorder(),
              ),
              validator: (text) {
                if (text!.isEmpty) {
                  return "Nome inválido!";
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Endereço",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (text) {
                if (text!.isEmpty || text.length < 6) {
                  return "Endereço inválido!";
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {}
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(LinearBorder.bottom())),
                child: const Text("Criar Conta"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
