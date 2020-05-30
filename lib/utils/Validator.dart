import 'package:userregistration/application/AppConstants.dart';

class Validator {

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return EmailConstants.EmptyEmail;
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return EmailConstants.InvalidEmail;
    else
      return null;
  }

  static String validatePassword(String password) {
    
    if(password.isEmpty) {
      return PasswordConstants.EmptyPassword;
    }

    if(!isValidLength(password, 9)) {
      return PasswordConstants.LengthError;
    }

    if(!containsUpperCaseChar(password)) {
      return PasswordConstants.UppercaseError;
    }

    if (!containsLowerCaseChar(password)) {
      return PasswordConstants.LowercaseError;
    }

    if(!containsDigit(password)) {
      return PasswordConstants.DigitError;
    }

    return null;
  }

  static bool containsLowerCaseChar(String value) {
    if(value.isEmpty) return false;
    Pattern lowercasePattern = r'(.*[a-z].*)';
    RegExp regex = RegExp(lowercasePattern);
    return regex.hasMatch(value);

  }

  static bool containsUpperCaseChar(String value) {
    if(value.isEmpty) return false;
    Pattern upperCasePattern = r'(.*[A-Z].*)';
    RegExp regex = RegExp(upperCasePattern);
    return regex.hasMatch(value);
  }

  static bool containsDigit(String value) {
    if(value.isEmpty) return false;
    Pattern digitPattern = r'(.*\d.*)';
    RegExp regex = RegExp(digitPattern);
    return regex.hasMatch(value);
  }

  static bool isValidLength(String value, int length) {
    if(value.isEmpty) return false;
    return value.length > length;
  }

  static String validatePersonalInfo(
      String goalForActivation,
      String monthlyIncome,
      String monthlyExpenses) {

    if(goalForActivation == PersonalInfoConstants.ChooseOption) {
      return PersonalInfoConstants.InvalidGoal;
    }

    if(monthlyIncome == PersonalInfoConstants.ChooseOption) {
      return PersonalInfoConstants.InvalidIncome;
    }

    if(monthlyExpenses == PersonalInfoConstants.ChooseOption) {
      return PersonalInfoConstants.InvalidExpense;
    }

    // TODO:: implement a validation that monthly expenses cannot more than monthly income
    return null;
  }

}
