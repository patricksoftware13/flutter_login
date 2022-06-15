import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:social_network_flutter/login.dart';

class CadPage extends StatefulWidget {
  const CadPage({Key? key}) : super(key: key);

  final String title = 'Cadastro de Usuário';

  @override
  State<CadPage> createState() => _Cadastro();
}

class _Cadastro extends State<CadPage> {
  String _age = '';
  String _address = '';
  String _email = '';
  String _name = '';
  String _pass1 = '';
  int _idade = 0;

  // ignore: non_constant_identifier_names
  void Cadastrar() async {
    String api = 'https://example-ecommerce.herokuapp.com/user/customer/add';

    _idade = int.parse(_age);

    Response response = await post(
      Uri.parse(api),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'address': _address,
        'age': _idade.toString(),
        'email': _email,
        'name': _name,
        'userPassword': _pass1
      }),
    );

    if (response.statusCode == 201) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
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
                    labelText: 'Nome Completo:',
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    setState(() {
                      _age = text;
                    });
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Idade:',
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _address = text;
                    });
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Endereço:',
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _email = text;
                    });
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'E-mail:',
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
                  Cadastrar();
                },
                child: const Text('Confirmar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
