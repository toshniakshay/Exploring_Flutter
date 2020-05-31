import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:userregistration/application/AppConstants.dart';
import 'package:userregistration/application/colors.dart';
import 'package:userregistration/model/PasswordConstraint.dart';
import 'package:userregistration/model/RegistrationInfo.dart';
import 'package:userregistration/utils/Helper.dart';
import 'package:userregistration/utils/Validator.dart';
import 'package:userregistration/widgets/BottomSheet.dart';
import 'package:userregistration/widgets/PasswordValidationWidget/PasswordValidationWidget.dart';
import 'package:userregistration/widgets/StepperEx.dart';

class InputPasswordScreen extends StatefulWidget {

  RegistrationInfo userInfo;

  InputPasswordScreen({@required this.userInfo}) : assert(userInfo != null);

  @override
  _InputPasswordScreenState createState() => _InputPasswordScreenState(userInfo);
}

class _InputPasswordScreenState extends State<InputPasswordScreen> {
  final TextEditingController passwordTextController = TextEditingController();
  String _passwordComplexity = "";
  Color _passwordComplexityColor = Colors.white;
  bool _autoValidate = false;

  Widget lowecaseWidget;
  Widget uppercaseWidget;
  Widget numberWidget;
  Widget lengthWidget;


  RegistrationInfo userInfo;

  _InputPasswordScreenState(this.userInfo);

  @override
  void initState() {
    super.initState();

    // text change listener
    passwordTextController.addListener(() => _passwordConstraintsState(false));
    _passwordConstraintsState(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AppBar(
        backgroundColor: Helper.getColorFromHex(AppColors.AppBgColor),
        title: new Text(AppConstants.CreateAccount),
        elevation: 0.0,
      ), preferredSize: Size.fromHeight(40.0)),
      backgroundColor: Helper.getColorFromHex(AppColors.AppBgColor),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[StepperEx(height: 100.0,currentState: 2)],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 50),
                  child: Text(
                    PasswordConstants.CreatePassword,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    PasswordConstants.CreatePasswordDesc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 40.0, bottom: 10.0, right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(7.0))),
                    child: TextFormField(
                      obscureText: true,
                      autovalidate: _autoValidate,
                      validator: Validator.validatePassword,
                      controller: passwordTextController,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: PasswordConstants.CreatePassword,
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.black,
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        PasswordConstants.Complexity,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(_passwordComplexity,
                          style: TextStyle(
                              color: _passwordComplexityColor,
                              fontSize: 18.0, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: _passwordConstraints(context),
                )
              ],
            ),
          ),
          BottomSheetEx(
              btnTextColor: Colors.blue,
              buttonColor: Colors.white,
              nextButtonAction: () => {onNextButtonClick(context)})
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordTextController.dispose(); // release unused memory in RAM
    super.dispose();
  }

  onNextButtonClick(BuildContext context) {
    String result = Validator.validatePassword(passwordTextController.text);
    if (result == null) {
      userInfo.password = passwordTextController.text.toString();
      Navigator.of(context).pushNamed(AppConstants.PersonalInfoRoute, arguments: userInfo);
    } else {
      Helper.showErrorDialog(context, result);
    }
  }

  Widget _passwordConstraints(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        lowecaseWidget,
        uppercaseWidget,
        numberWidget,
        lengthWidget,
      ],
    );
  }

  void _passwordConstraintsState(bool init) {
    String text = passwordTextController.text;
    setState(() {
      lowecaseWidget = _prepareWidget(
          PasswordConstants.lowerCase, PasswordConstants.lowerCaseDesc, Validator.containsLowerCaseChar(text));
      uppercaseWidget = _prepareWidget(
          PasswordConstants.upperCase, PasswordConstants.upperCaseDesc, Validator.containsUpperCaseChar(text));
      numberWidget =
          _prepareWidget(PasswordConstants.number, PasswordConstants.numberDesc, Validator.containsDigit(text));
      lengthWidget =
          _prepareWidget(PasswordConstants.pwdLength, PasswordConstants.characterDesc, Validator.isValidLength(text, 9));

      _updateCoPasswordComplexity();
    });
  }

  Widget _prepareWidget(String title, String subtitle, bool valid) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: PasswordValidationWidget(
          passwordConstraint: PasswordConstraint(title, subtitle, valid),
        ),
      ),
    );
  }

  void _updateCoPasswordComplexity() {
    setState(() {
      String text = passwordTextController.text;
      if (text.isEmpty) {
        _passwordComplexity = "";
      } else if (text.length <= 5) {
        _passwordComplexity = PasswordConstants.Weak;
        _passwordComplexityColor = Colors.red;
      } else if (text.length > 5 && text.length < 9) {
        _passwordComplexity = PasswordConstants.Good;
        _passwordComplexityColor = Colors.orangeAccent;
      } else {
        _passwordComplexity = PasswordConstants.Strong;
        _passwordComplexityColor = Colors.lightGreen;
      }
    });
  }

}

