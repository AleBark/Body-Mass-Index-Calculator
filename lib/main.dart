import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: null)
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline, size: 120, color: Colors.grey),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Weight (Kg)",
                labelStyle: TextStyle(color: Colors.grey)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 20.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Height (m)",
                labelStyle: TextStyle(color: Colors.grey)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
