import 'package:flutter/material.dart';
import 'package:userregistration/application/AppConstants.dart';
import 'package:userregistration/application/colors.dart';
import 'package:userregistration/utils/Helper.dart';

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Register Account"),
        backgroundColor: Helper.getColorFromHex(AppColors.AppBgColor),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.blue, // button color
                  child: InkWell(
                    splashColor: Colors.white, // inkwell color
                    child: SizedBox(width: 56, height: 56, child: Icon(Icons.play_arrow)),
                    onTap: () {
                      Navigator.of(context).pushNamed(AppConstants.EmailRoute);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Register User", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              )
            ],
          )
      ),
    );
  }
}