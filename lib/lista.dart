import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  Lista({Key? key, required this.datalist}) : super(key: key);

  final List<dynamic> datalist;

  // This widget is the root
  // of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "ListView.builder",
        theme: new ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: new ListViewBuilder(datalist: datalist));
  }
}

class ListViewBuilder extends StatelessWidget {
  var datalist;

  ListViewBuilder({Key? key, this.datalist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Produtos")),
      body: ListView.builder(
          itemCount: datalist.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(Icons.list),
                trailing: Text(
                  "",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text(datalist[index]['name']));
          }),
    );
  }
}
