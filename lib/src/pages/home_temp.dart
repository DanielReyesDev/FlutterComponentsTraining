import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  final options = ["Uno", "Dos", "Tres"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _listBuilder2()
      ),
    );
  }

  List<Widget> _listBuilder(){
    List<Widget> list = new List<Widget>();
    for (var opt in options) {
      final widget = ListTile(title: Text(opt));
      list..add(widget)
          ..add(Divider());
    }
    return list;
  }

  List<Widget> _listBuilder2(){
    return this.options.map( ( item ) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + "!"),
            subtitle: Text("Anything"),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }

}