import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<int> _numbersList = new List();
  int _lastItem = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _addImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList(){
    return ListView.builder(
      controller: _scrollController,
      itemCount: _numbersList.length,
      itemBuilder: (BuildContext context, int index) {
        final int image = _numbersList[index];
        return FadeInImage(
          image: NetworkImage("https://picsum.photos/500/300/?image=$image"),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }


  void _addImages() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }

    setState(() {
      
    });
  }





}