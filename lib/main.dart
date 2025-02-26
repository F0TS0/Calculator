import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";

  void _buttonPressed(String value) {
    setState(() {
      if (_output == "0") {
        _output = value;
      } else {
        _output += value;
      }
    });
  }

  void _clear() {
    setState(() {
      _output = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.5,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              List<String> buttons = [
                "7",
                "8",
                "9",
                "C",
                "4",
                "5",
                "6",
                "+",
                "1",
                "2",
                "3",
                "=",
              ];

              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (buttons[index] == "C") {
                      _clear();
                    } else {
                      _buttonPressed(buttons[index]);
                    }
                  },
                  child: Text(
                    buttons[index],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
