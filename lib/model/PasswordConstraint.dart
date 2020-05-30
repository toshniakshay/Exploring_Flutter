class PasswordConstraint {

  String _title;
  String _subTitle;
  bool _isValid;

  PasswordConstraint(this._title, this._subTitle, this._isValid);

  String get title => _title;

  String get subTitle => _subTitle;

  bool get isValid => _isValid;
}