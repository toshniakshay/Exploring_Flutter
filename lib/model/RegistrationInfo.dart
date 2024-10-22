
/// Registration object which will have all the required information registering a user
class RegistrationInfo {
  String _email;

  set email(String value) {
    _email = value;
  }

  String _password;
  String _goal;
  String _monthlyIncome;
  String _monthlyExpense;
  String _meetingDate;
  String _meetingTime;

  String get email => _email;

  String get password => _password;

  String get goal => _goal;

  String get monthlyIncome => _monthlyIncome;

  String get monthlyExpense => _monthlyExpense;

  String get meetingDate => _meetingDate;

  String get meetingTime => _meetingTime;

  set password(String value) {
    _password = value;
  }

  set goal(String value) {
    _goal = value;
  }

  set monthlyIncome(String value) {
    _monthlyIncome = value;
  }

  set monthlyExpense(String value) {
    _monthlyExpense = value;
  }

  set meetingDate(String value) {
    _meetingDate = value;
  }

  set meetingTime(String value) {
    _meetingTime = value;
  }

  @override
  String toString() {
    return 'RegistrationInfo{_email: $_email, _password: $_password, _goal: $_goal, _monthlyIncome: $_monthlyIncome, _monthlyExpense: $_monthlyExpense, _meetingDate: $_meetingDate, _meetingTime: $_meetingTime}';
  }
}
