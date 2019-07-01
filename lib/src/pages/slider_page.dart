import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {


  double _sliderValue = 100.0;
  bool _lockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _buildSlider(),
            _buildCheckBox(),
            _buildSwitch(),
            Expanded(child: _buildImage())
          ],
        )
      ),
    );
  }

  Widget _buildSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Size of the image",
      // divisions: 20,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_lockCheck) ? null : (double val){
        print(val);
        setState(() {
          _sliderValue = val;
        });
      },
    );
  }

  Widget _buildCheckBox() {
    return CheckboxListTile(
      title: Text("Lock Slider"),
      value: _lockCheck,
      onChanged: (val){
        setState(() {
          _lockCheck  = val;
        });
      },
    );
  }

  Widget _buildSwitch() {
    return SwitchListTile(
      title: Text("Lock Slider"),
      value: _lockCheck,
      onChanged: (val){
        setState(() {
          _lockCheck  = val;
        });
      },
    );
  }


  Widget _buildImage() {
    return Image(
      image: NetworkImage("https://avatars0.githubusercontent.com/u/39273205?s=400&u=feaabf0bd850b7d59547b9a9dd7ff59ff21a2d31&v=4"),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }
}