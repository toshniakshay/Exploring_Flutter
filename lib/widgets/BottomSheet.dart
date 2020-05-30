import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetEx extends StatelessWidget {
  final Function nextButtonAction;
  final Color buttonColor;
  final Color btnTextColor;

  BottomSheetEx(
      {
        @required this.nextButtonAction,
        @required this.buttonColor,
        @required this.btnTextColor
      }
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child:   ButtonTheme(
                  minWidth: 350.0,
                  height: 50.0,
                  child: RaisedButton(
                    key: Key("NextBtn"),
                    elevation: 5,
                    color: buttonColor,
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 25, color: btnTextColor),
                    ),
                    onPressed: nextButtonAction,
                  ),
                ),
              )

            ]),
      )
    );
  }
}
