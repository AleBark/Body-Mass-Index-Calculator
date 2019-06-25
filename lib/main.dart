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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _infoText = 'Please enter your details above';

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = 'Please enter your details above';
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double bmi = weight / (height * height);

      if (bmi < 18.5) {
        _infoText = "Underweight (${bmi.toStringAsPrecision(3)})";
      } else if (bmi >= 18.5 && bmi < 24.9) {
        _infoText = "Normal weight (${bmi.toStringAsPrecision(3)})";
      } else if (bmi >= 24.9 && bmi < 29.9) {
        _infoText = "Overweight (${bmi.toStringAsPrecision(3)})";
      } else if (bmi >= 29.9) {
        _infoText = "Obesity (${bmi.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120, color: Colors.grey),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Weight (kg)",
                  labelStyle: TextStyle(color: Colors.grey)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Height (cm)",
                  labelStyle: TextStyle(color: Colors.grey)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calculate,
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
