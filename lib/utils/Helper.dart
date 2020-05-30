import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  static List<String> getGoalsForActivation() {
    List<String> goalsList = List();

    goalsList.add("Retirement Planning");
    goalsList.add("Buy a Home");
    goalsList.add("Buy a Car");
    goalsList.add("Travelling");
    goalsList.add("Other");

    return goalsList;
  }

  static List<String> getMonthlyIncomeList() {
    List<String> monthlyIncome = List();

    monthlyIncome.add("below 10000");
    monthlyIncome.add("10000-30000");
    monthlyIncome.add("30000-50000");
    monthlyIncome.add("50000-70000");
    monthlyIncome.add("70000- 1 Lakh");
    monthlyIncome.add("more than 1 Lakh");

    return monthlyIncome;
  }

  static List<String> getMonthlyExpenseList() {
    List<String> monthlyExpense = List();

    monthlyExpense.add("below 10000");
    monthlyExpense.add("10000-30000");
    monthlyExpense.add("30000-50000");
    monthlyExpense.add("50000-70000");
    monthlyExpense.add("70000- 1 Lakh");
    monthlyExpense.add("more than 1 Lakh");

    return monthlyExpense;
  }
  
  static String getDateInReadableFormat(String value) {
    var date = DateTime.parse(value);
    var formatter = new DateFormat('yMMMEd');
    String formatted = formatter.format(date);
    return formatted;
  }

  static showErrorDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          key: Key('ErrorDialog'),
          title: Text("Error", style: TextStyle(color: Colors.red),),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        )
    );
  }

  static showSuccessDialog(BuildContext context, String msg, Function callback) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Success", style: TextStyle(color: Colors.black),),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                callback;
              },
            )
          ],
        )
    );
  }
}