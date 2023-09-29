import 'package:chaton/pages/auth/register_page.dart';
import 'package:chaton/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String passwprd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "ChatOn",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Faça Login para conversar seus amigos!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Image.asset("assets/login.png"),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                labelText: "Email",
                prefixIcon: Icon(
                  Icons.email,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
              validator: (val) {
                return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val!)
                    ? null
                    : "Coloque um email valido";
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              decoration: textInputDecoration.copyWith(
                labelText: "Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onChanged: (val) {
                setState(() {
                  passwprd = val;
                });
              },
              validator: (val) {
                if (val!.length < 6) {
                  return "A senha precisa ter pelo menos 6 digitos";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
                text: "Não possui uma conta? ",
                style: const TextStyle(color: Colors.black, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                      text: "Registre-se",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          nextScreen(context, RegisterPage());
                        })
                ]))
          ],
        ),
      ),
    ));
  }

  login() {
    if (formKey.currentState!.validate()) {}
  }
}
