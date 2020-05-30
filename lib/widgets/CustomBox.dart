import 'package:flutter/material.dart';

class CustomBoxWidget extends StatelessWidget {
  final String boxHeader;
  final String selectedOption;
  final Function onClickAction;

  CustomBoxWidget(
      {@required this.boxHeader,
      @required this.selectedOption,
      @required this.onClickAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onClickAction,

      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 2),
              child: Text(
                boxHeader,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 15),
              child: Text(
                selectedOption,
                style: TextStyle(fontSize: 23, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
