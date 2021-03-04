import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';
import 'riwayatkonversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  TextEditingController inputController = new TextEditingController();
  var listItem = ["Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double result = 0;
  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();
  final konvertHandler = Function;

  void hitungSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin")
        result = _inputUser + 273;
      else
        result = (4 * _inputUser) / 5;
      listViewItem.add("$_newValue : $result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konvensi Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children:[
              Input(inputController: inputController),
              buildDropdownButton(),
              Result(result: result),
              Convert(konvertHandler: hitungSuhu),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child:RiwayatKonversi(listViewItem: listViewItem),
                 ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValue,
      onChanged: (String changeValue) {
        setState(() {
          _newValue = changeValue;
        });
      },
    );
  }
}

