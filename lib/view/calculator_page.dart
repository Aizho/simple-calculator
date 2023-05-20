import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:simple_calculator_2/view/widget/calculator_button.dart';
import 'package:simple_calculator_2/viewmodel/app_view_model.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  

  AppViewModel appViewModel = AppViewModel();



  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: Text(
                appViewModel.userInput,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              color: Colors.black45,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              color: Colors.black45,
              child: Text(
                appViewModel.result,
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ),
          Divider(color: Colors.white, height: 1),
          Expanded(
            flex: 6,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 12,
              ),
              itemCount: appViewModel.buttonsList.length,
              itemBuilder: (context, index) => CalculatorButton(
                text: appViewModel.buttonsList[index],
                color: appViewModel.getColor(appViewModel.buttonsList[index]),
                buttonTapped: () {
                  String value = appViewModel.buttonsList[index];
                  setState(() {
                    appViewModel.buttonTapped(value);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
