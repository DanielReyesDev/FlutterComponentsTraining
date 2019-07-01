import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";
  String _selectedOption = "Fly";


  List<String> _powers = ["Fly", "x Ray", "Super Breathe", "Super Strength"];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        children: <Widget>[
          _buildNameInput(),
          Divider(),
          _buildEmailInput(),
          Divider(),
          _buildPasswordInput(),
          Divider(),
          _buildDateInput(context),
          Divider(),
          _buildDropdown(),
          Divider(),
          _buildPersonTile(),
        ],
      )
    );
  }
  _buildNameInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_name.length}"),
        hintText: "Nombre de la persona",
        labelText: "Nombre",
        helperText: "Solo es el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;  
        });
      },
    );
  }

  Widget _buildPersonTile() {
    return ListTile(
      title: Text("Nombre es: $_name"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_selectedOption),
    );
  }

  Widget _buildEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: "Email",
        labelText: "Email",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;  
        });
      },
    );
  }

  Widget _buildPasswordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: "Password",
        labelText: "Password",
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;  
        });
      },
    );
  }

  Widget _buildDateInput(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      }
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale("es", "ES")
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach((power){
      list.add( DropdownMenuItem(
        child: Text(power),
        value: power
      ));
    });
    return list;
  }

  Widget _buildDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: _selectedOption,
          items: getDropdownOptions(),
          onChanged: (String option) {
            setState(() {
              this._selectedOption = option;
            });
          },
        )
      ],
    );

  }


}