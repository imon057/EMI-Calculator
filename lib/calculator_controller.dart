import 'dart:math';

class CalculatorController {
  // Function to calculate monthly EMI
  double calculateMonthlyPayment(
      double principal, double interest, int tenure) {
    if (principal <= 0 || interest <= 0 || tenure <= 0) {
      return 0.0; // Handle invalid inputs
    }
    // Calculate monthly interest rate
    double monthlyInterestRate = interest / 12;

    // Calculate total number of monthly payments
    int totalPayments = tenure * 12;

    // EMI formula
    double emi = (principal *
            monthlyInterestRate *
            pow((1 + monthlyInterestRate), totalPayments)) /
        (pow((1 + monthlyInterestRate), totalPayments) - 1);
    return emi;
  }
}
