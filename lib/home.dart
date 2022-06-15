import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:social_network_flutter/lista.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = 'Listar Produtos';

  @override
  State<HomePage> createState() => _Lista();
}

class _Lista extends State<HomePage> {
  // ignore: non_constant_identifier_names
  void Listar() async {
    const request = 'https://example-ecommerce.herokuapp.com/product/list';

    http.Response response = await http.get(Uri.parse(request));

    print(response.body);
    final List<dynamic> dataList = jsonDecode(response.body);
    print(dataList[0]);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Lista(datalist: dataList)),
    );
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextButton(
                onPressed: () {
                  Listar();
                },
                child: const Text('Listar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
