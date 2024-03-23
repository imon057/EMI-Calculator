import 'package:emi_loan_calculator/emi_loan_calc_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EMILoanCalcUI(), // Use the imported UI class
    );
  }
}
