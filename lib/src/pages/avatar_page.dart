import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://avatars0.githubusercontent.com/u/39273205?s=400&u=feaabf0bd850b7d59547b9a9dd7ff59ff21a2d31&v=4"),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              child: Text("DR"),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Stan_Lee_by_Gage_Skidmore_3.jpg/220px-Stan_Lee_by_Gage_Skidmore_3.jpg"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}