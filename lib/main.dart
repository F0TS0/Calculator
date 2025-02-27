import 'package:flutter/material.dart';
import 'calculator_logic.dart'; // Import the logic file

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
  final CalculatorLogic _calculator = CalculatorLogic(); // Use the logic class

  void _buttonPressed(String value) {
    setState(() {
      _calculator.addInput(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator")),
      body: Column(
        children: [
          // Displaying the result
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _calculator.getOutput(), // Get the output from logic
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Buttons for the calculator
          Flexible(
            flex: 2,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
              itemCount: 16, // Number of buttons
              itemBuilder: (context, index) {
                List<String> buttons = [
                  "7",
                  "8",
                  "9",
                  "C",
                  "4",
                  "5",
                  "6",
                  "/",
                  "1",
                  "2",
                  "3",
                  "*",
                  "0",
                  "+",
                  "-",
                  "=",
                ];

                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => _buttonPressed(buttons[index]),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16.0), // Add padding to button
                    ),
                    child: Text(
                      buttons[index],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
