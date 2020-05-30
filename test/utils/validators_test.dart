import 'package:flutter_test/flutter_test.dart';
import 'package:userregistration/application/AppConstants.dart';
import 'package:userregistration/utils/Validator.dart';

void main() {
  test("Test for validating email address", () {
    // Setup
    String emptyEmail = "";
    String validEmail = "akshay@test.com";
    String invalidEmail = "akshay.com";

    // Act
    var emptyEmailResult = Validator.validateEmail(emptyEmail);
    var validEmailResult = Validator.validateEmail(validEmail);
    var invalidEmailResult = Validator.validateEmail(invalidEmail);

    // Assert
    expect(emptyEmailResult, EmailConstants.EmptyEmail);
    expect(validEmailResult, null);
    expect(invalidEmailResult, EmailConstants.InvalidEmail);
  });

  test("test for validating password", () {
    // Setup
    String emptyPassword = "";
    String validPassword = "Akshay123#";
    String passwordWithoutLowerCase = "AKSHAY123#";
    String passwordWithoutUpperCase = "akshay123#";
    String passwordWithoutNumbers = "akshayToshniwal";
    String passwordWithLowercaseOnly = "akshaytoshniwal";
    String passwordWithUpperCaseOnly = "AKSHAYTOSHNIWAL";
    String passwordWithNumbersOnly = "1234567890";
    String passwordLengthInvalid = "Akshay123";

    // Act
    var emptyPasswordResult = Validator.validatePassword(emptyPassword);
    var validPasswordResult = Validator.validatePassword(validPassword);
    var withoutLowerCaseResult = Validator.validatePassword(passwordWithoutLowerCase);
    var withoutUpperCaseResult = Validator.validatePassword(passwordWithoutUpperCase);
    var withoutNumbersResult = Validator.validatePassword(passwordWithoutNumbers);
    var withLowerCaseOnlyResult = Validator.validatePassword(passwordWithLowercaseOnly);
    var withUppercaseOnlyResult = Validator.validatePassword(passwordWithUpperCaseOnly);
    var withNumbersOnlyResult = Validator.validatePassword(passwordWithNumbersOnly);
    var passwordLengthInvalidResult = Validator.validatePassword(passwordLengthInvalid);

    // Assert
    expect(emptyPasswordResult, PasswordConstants.EmptyPassword);
    expect(validPasswordResult, null);
    expect(withoutLowerCaseResult, PasswordConstants.LowercaseError);
    expect(withoutUpperCaseResult, PasswordConstants.UppercaseError);
    expect(withoutNumbersResult, PasswordConstants.DigitError);
    expect(withLowerCaseOnlyResult, PasswordConstants.UppercaseError);
    expect(withUppercaseOnlyResult, PasswordConstants.LowercaseError);
    expect(withNumbersOnlyResult, PasswordConstants.UppercaseError);
    expect(passwordLengthInvalidResult, PasswordConstants.LengthError);
  });

}