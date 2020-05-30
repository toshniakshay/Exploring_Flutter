import 'package:flutter/material.dart';

class BouncyAnimation extends PageRouteBuilder {
  final Widget destinationScreen;

  BouncyAnimation({this.destinationScreen})
      : super(
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAniation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.center,
              );
            },
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAniation) {
              return destinationScreen;
            });
}
