import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var number1 = 0.0, number2 = 0.0, output = 0.0;

  final TextEditingController number1Controller =
      TextEditingController(text: "0");
  final TextEditingController number2Controller =
      TextEditingController(text: "0");

  void performOperation(int operation) {
    setState(() {
      number1 = double.parse(number1Controller.text);
      number2 = double.parse(number2Controller.text);

      switch (operation) {
        case 2:
          output = number1 - number2;
          break;
        case 3:
          output = number1 * number2;
          break;
        case 4:
          output = number1 / number2;
          break;
        default:
          output = number1 + number2;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Output: $output",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: number1Controller,
                decoration: InputDecoration(hintText: "Enter Number 1"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: number2Controller,
                decoration: InputDecoration(hintText: "Enter Number 2"),
              ),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      performOperation(1);
                    },
                    child: Text("+"),
                    color: Colors.redAccent,
                  ),
                  MaterialButton(
                    onPressed: () {
                      performOperation(2);
                    },
                    child: Text("-"),
                    color: Colors.redAccent,
                  ),
                  MaterialButton(
                    onPressed: () {
                      performOperation(3);
                    },
                    child: Text("*"),
                    color: Colors.redAccent,
                  ),
                  MaterialButton(
                    onPressed: () {
                      performOperation(4);
                    },
                    child: Text("/"),
                    color: Colors.redAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
