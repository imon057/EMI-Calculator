import 'package:flutter/material.dart';
import 'calculator_controller.dart';

class EMILoanCalcUI extends StatefulWidget {
  @override
  _EMILoanCalcUIState createState() => _EMILoanCalcUIState();
}

class _EMILoanCalcUIState extends State<EMILoanCalcUI> {
  final calculatorController = CalculatorController();

  // Text editing controllers for user input
  final principalController = TextEditingController();
  final interestController = TextEditingController();
  final tenureController = TextEditingController();

  // Variable to store calculated EMI
  double emi = 0.0;

  @override
  void dispose() {
    principalController.dispose();
    interestController.dispose();
    tenureController.dispose();
    super.dispose();
  }

  // Function to calculate EMI on button click
  void calculateEMI() {
    double principal = double.parse(principalController.text);
    double interest = double.parse(interestController.text) /
        100; // Convert interest rate to decimal
    int tenure = int.parse(tenureController.text);
    emi = calculatorController.calculateMonthlyPayment(
        principal, interest, tenure);
    setState(() {}); // Update UI with calculated EMI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: principalController,
              decoration: InputDecoration(labelText: 'Principal Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: interestController,
              decoration: InputDecoration(labelText: 'Interest Rate (%)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tenureController,
              decoration: InputDecoration(labelText: 'Loan Tenure (Years)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateEMI,
              child: Text('Calculate EMI'),
            ),
            SizedBox(height: 20.0),
            Text('EMI: Tk.$emi'), // Display calculated EMI
          ],
        ),
      ),
    );
  }
}
