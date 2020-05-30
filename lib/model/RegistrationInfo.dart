class RegistrationInfo {

  String _email;
  String _password;
  String _goal;
  String _monthlyIncome;
  String _monthlyExpense;

  RegistrationInfo(
      this._email,
      this._password,
      this._goal,
      this._monthlyIncome,
      this._monthlyExpense
      );
  String get email => _email;
  String get password => _password;
  String get goal => _goal;
  String get monthlyIncome => _monthlyIncome;
  String get monthlyExpense => _monthlyExpense;
}