import 'package:flutter/material.dart';
import 'package:userregistration/model/PasswordConstraint.dart';


class PasswordValidationWidget extends StatelessWidget {
  final PasswordConstraint passwordConstraint;

  PasswordValidationWidget(
      {@required this.passwordConstraint});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _setTitle(context),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            passwordConstraint.subTitle,
            style: TextStyle(fontSize: 10.0, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _setTitle(BuildContext context) {
    if(!passwordConstraint.isValid) {
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          passwordConstraint.title,
          style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Container(

        child: Image(
          image: AssetImage("images/tick.png"),
          width: 30.0,
          height: 30.0,
        ),
      );
    }
  }
}
