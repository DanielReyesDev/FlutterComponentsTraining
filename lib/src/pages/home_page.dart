import 'package:components_training/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import '../utils/icon_utils.dart';
import '../pages/alert_page.dart';
import '../pages/avatar_page.dart';

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
		return FutureBuilder(
			future: menuProvider.loadData(),
			initialData: [],
			builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
				print("[🚀 Builder]: ${snapshot.data}");
				return ListView(children: _itemsBuilder(snapshot.data, context));
			},
		);
	}

	

	List<Widget> _itemsBuilder( List<dynamic> data, BuildContext context) {
		final List<Widget> options = [];
		data.forEach((opt){
			final widget = ListTile(
				title: Text(opt["texto"]),
				leading: getIcon(opt["icon"]),
				trailing: Icon(Icons.keyboard_arrow_right),
				onTap: (){
					Navigator.pushNamed(context, opt['ruta']);
				},
			);
			options..add(widget)
             ..add(Divider());
					
		});
		return options;
	}


}