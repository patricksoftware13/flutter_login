import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:social_network_flutter/cadastro.dart';
import 'package:social_network_flutter/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  final String title = 'Login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = '';
  String _pass1 = '';

  void signIn() async {
    String api = 'https://example-ecommerce.herokuapp.com/user/login';

    Response response = await post(
      Uri.parse(api),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'login': _name, 'password': _pass1}),
    );

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // configura o  AlertDialog
      const AlertDialog(
        title: Text("Erro no cadastro"),
        content: Text("Falha no cadastro, verifique as informações"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _name = text;
                    });
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Login:',
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: true,
                  onChanged: (text) {
                    setState(() {
                      _pass1 = text;
                    });
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Informe a senha:',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextButton(
                onPressed: () {
                  signIn();
                },
                child: const Text('Entrar'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CadPage()),
                  );
                },
                child: const Text('Cadastrar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
