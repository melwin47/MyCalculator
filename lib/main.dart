import 'package:flutter/material.dart';
import 'package:my_calculator/calculator_button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});
  
  @override
  State<MyCalculator> createState() => _MyCalculator();
  
}

class _MyCalculator extends State<MyCalculator>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: CalculatorButton(),
    );
    
  }

}

