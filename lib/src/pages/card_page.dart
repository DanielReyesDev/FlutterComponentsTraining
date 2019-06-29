import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10), 
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2()
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 15.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Title"),
            subtitle: Text("This is a subtitle of a card... This is a subtitle of a card...This is a subtitle of a card."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){},
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/06/ultra-wide-mistakes-lead-image.jpg'),
            placeholder: AssetImage("assets/jar-loading.gif"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Some text here..."),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: card,
      ),
    );
  }
}