

import 'package:flutter/material.dart';
import 'package:userregistration/model/RegistrationInfo.dart';

class ProfilePage extends StatelessWidget {

  RegistrationInfo userInfo;

  ProfilePage({@required this.userInfo}) : assert(userInfo != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(userInfo.toString(), style: TextStyle(fontSize: 15.0),),
      ),
    );
  }
}
