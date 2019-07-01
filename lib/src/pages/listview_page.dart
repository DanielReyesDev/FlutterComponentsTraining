import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<int> _numbersList = new List();
  int _lastItem = 0;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Stack(
        children: <Widget>[
          _buildList(),
          _buildLoading()
        ],
      )
    );
  }

  Widget _buildLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 32.0,)
        ],
      );
    } else {
      return Container();
    }
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

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = Duration(seconds: 2);
    return new Timer( duration , _fakeHttpResponse);
  }

  void _fakeHttpResponse() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _addImages();
  }

  void _addImages() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }
    setState(() {});
  }





}