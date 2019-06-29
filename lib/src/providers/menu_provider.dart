import 'package:flutter/services.dart' show rootBundle;


class _MenuProvider {

  List<dynamic> options = [];

  _MenuProvider() {
    loadData();
  }

  void loadData() {
    rootBundle.loadString('data/menu_opts.json')
        .then((data){
          print(data);
        });

  }

}

final _menuProvider = new _MenuProvider();