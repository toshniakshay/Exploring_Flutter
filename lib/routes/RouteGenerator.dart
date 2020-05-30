import 'package:flutter/material.dart';
import 'package:userregistration/anim/SlideAnimation.dart';
import 'package:userregistration/application/AppConstants.dart';
import 'package:userregistration/pages//Welcome.dart';
import 'package:userregistration/pages/InputEmailScreen.dart';
import 'package:userregistration/pages/InputPasswordScreen.dart';
import 'package:userregistration/pages/PersonalInformation.dart';
import 'package:userregistration/pages/ScheduleMeetingScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppConstants.DefaultRoute:
        return SlideRightRoute(
            page: WelcomeWidget()
        );
        break;

      case AppConstants.EmailRoute:
        if (args is String) {
          return SlideRightRoute(
              page: InputEmailScreen()
          );
        }
        return _errorRoute();

      case AppConstants.PasswordRoute:
        return SlideRightRoute(
            page: InputPasswordScreen()
        );

      case AppConstants.PersonalInfoRoute:
        return SlideRightRoute(
            page: PersonalInformation()
        );

      case AppConstants.ScheduleMeetingRoute:
        return SlideRightRoute(
            page: ScheduleMeetingScreen()
        );
        break;

      default:
        return _errorRoute();
    }
  }

  ///
  /// Error router function that can be utilized whenever we want to redirect user to
  /// Error page
  ///
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(ErrorConstants.Error),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text(
            ErrorConstants.DefaultErrorRoute,
            style: TextStyle(fontSize: 25.0, color: Colors.red),
          ),
        ),
      );
    });
  }
}
