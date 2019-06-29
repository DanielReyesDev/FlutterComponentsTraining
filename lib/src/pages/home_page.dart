import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _list()
    );
  }

  Widget _list() {
    return ListView(
      children: _itemsBuilder(),
    );
  }

  List<Widget> _itemsBuilder() {
    return [
      ListTile(title: Text("Hola")),
      Divider(),
      ListTile(title: Text("Hola")),
      Divider(),
    ];
  }


}