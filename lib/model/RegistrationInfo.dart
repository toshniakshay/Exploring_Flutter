
/// Registration object which will have all the required information registering a user
class RegistrationInfo {
  String _email;
  String _password;
  String _goal;
  String _monthlyIncome;
  String _monthlyExpense;
  String _meetingDate;
  String _meetingTime;

  RegistrationInfo(this._email, this._password, this._goal, this._monthlyIncome,
      this._monthlyExpense, this._meetingDate, this._meetingTime);

  String get email => _email;

  String get password => _password;

  String get goal => _goal;

  String get monthlyIncome => _monthlyIncome;

  String get monthlyExpense => _monthlyExpense;

  String get meetingDate => _meetingDate;

  String get meetingTime => _meetingTime;

  @override
  String toString() {
    return 'RegistrationInfo{_email: $_email, _password: $_password, _goal: $_goal, _monthlyIncome: $_monthlyIncome, _monthlyExpense: $_monthlyExpense, _meetingDate: $_meetingDate, _meetingTime: $_meetingTime}';
  }
}
