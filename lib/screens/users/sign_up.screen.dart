import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/models.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  void _onSuccess() {}

  void _onFailed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: _globalKey,
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: [
                TextFormField(
                  controller: _nameController,
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
                  controller: _emailController,
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
                  controller: _passwordController,
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
                  controller: _addressController,
                  decoration: const InputDecoration(
                    hintText: "Endereço",
                    border: OutlineInputBorder(),
                  ),
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
                      if (_globalKey.currentState!.validate()) {
                        Map<String, dynamic> userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text,
                        };

                        model.signUp(
                          userData: userData,
                          pass: _passwordController.text,
                          onSuccess: _onSuccess,
                          onFailed: _onFailed,
                        );
                      }
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all(LinearBorder.bottom())),
                    child: const Text("Criar Conta"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
