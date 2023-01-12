import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<Calculator> {
  String equation = '';
  String result = '';
  String expression = "";
  String buttonText = "";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "C") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation == "0";
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll("X", "*");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 56, 20, 50),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23)),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(equation, style: TextStyle(fontSize: 30)),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(result, style: TextStyle(fontSize: 30)),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "AC";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "AC",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "C";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "C",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "%";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "%",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 30, 10, 20),
                    width: 70,
                    height: 63,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 61, 56, 56),
                        shape: BoxShape.circle),
                    child: Padding(
                        padding: EdgeInsets.all(1),
                        child: TextButton(
                          onPressed: () {
                            buttonText = "/";
                            buttonPressed(buttonText);
                          },
                          child: Text(
                            '/',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "7";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "7",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "8";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "8",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "9";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "9",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 30, 10, 20),
                    width: 70,
                    height: 63,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 61, 56, 56),
                        shape: BoxShape.circle),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            buttonText = "X";
                            buttonPressed(buttonText);
                          },
                          child: Text(
                            'X',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "4";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "4",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "5";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "5",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "6";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "6",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 30, 10, 20),
                    width: 70,
                    height: 63,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 61, 56, 56),
                        shape: BoxShape.circle),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            buttonText = "-";
                            buttonPressed(buttonText);
                          },
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "1";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "2";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "2",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "3";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "3",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 30, 10, 20),
                    width: 70,
                    height: 63,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 61, 56, 56),
                        shape: BoxShape.circle),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            buttonText = "+";
                            buttonPressed(buttonText);
                          },
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        "",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = "0";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        "0",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        buttonText = ".";
                        buttonPressed(buttonText);
                      },
                      child: Text(
                        ".",
                        style: TextStyle(
                            fontSize: 32, height: 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 30, 10, 20),
                    width: 70,
                    height: 63,
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            buttonText = "=";
                            buttonPressed(buttonText);
                          },
                          child: Text(
                            '=',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
