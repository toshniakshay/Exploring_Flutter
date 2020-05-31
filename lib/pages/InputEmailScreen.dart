import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:userregistration/application/AppConstants.dart';
import 'package:userregistration/application/colors.dart';
import 'package:userregistration/model/RegistrationInfo.dart';
import 'package:userregistration/utils/Helper.dart';
import 'package:userregistration/utils/Validator.dart';
import 'package:userregistration/widgets/BottomSheet.dart';
import 'package:userregistration/widgets/CustomClipper.dart';
import 'package:userregistration/widgets/StepperEx.dart';

class InputEmailScreen extends StatefulWidget {
  @override
  _InputEmailScreenState createState() => _InputEmailScreenState();
}

class _InputEmailScreenState extends State<InputEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  bool _autoValidate = false;
  var userInfo = RegistrationInfo();

  @override
  void initState() {
    super.initState();

    //todo :: if email field is already present in the userInfo obj then we need to prepopulate the email
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Helper.getColorFromHex(AppColors.EmailScreenBg),
        resizeToAvoidBottomPadding: false,
        body: Form(
            autovalidate: _autoValidate,
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  color: Helper.getColorFromHex(AppColors.AppBgColor),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      StepperEx(
                          height: 200.0,
                          currentState: 1
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      color: Helper.getColorFromHex(AppColors.AppBgColor),
                      width: double.infinity,
                      height: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding:
                        EdgeInsets.only(left: 20, top: 20.0, bottom: 30.0),
                        child: RichText(
                          text: TextSpan(
                            text: EmailConstants.EmailLine1,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 32.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: EmailConstants.EmailLine2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: 32.0)
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: 20.0, top: 20.0, bottom: 30.0),
                        child: Text(
                          EmailConstants.EmailDescription,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(7.0))),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              key: Key("email"),
                              autovalidate: _autoValidate,
                              controller: emailTextController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: EmailConstants.Email,
                                labelStyle: TextStyle(fontSize: 20),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: Validator.validateEmail,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                BottomSheetEx(
                    btnTextColor: Colors.white,
                    buttonColor: Colors.blue,
                    nextButtonAction: () =>
                        onNextButtonClick(context)
                )
              ],
            )),
      );
  }

  onNextButtonClick(BuildContext context) {
    final form = _formKey.currentState;
    if (form.validate()) {
      userInfo.email = emailTextController.text.toString();
      Navigator.of(context).pushNamed(AppConstants.PasswordRoute, arguments: userInfo);
    } else {
      Helper.showErrorDialog(
          context, Validator.validateEmail(emailTextController.text));
    }
  }
}
