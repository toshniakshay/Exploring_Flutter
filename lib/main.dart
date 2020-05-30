import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:userregistration/routes/RouteGenerator.dart';

//void main() {
//  // Set device orientation to only portrait
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//  .then((_) {
//    runApp(MainApp());
//  });
//}

//void main() => runApp(DevicePreview(
//    enabled: true,
//    builder: (context) => MainApp(),
//));

void main() => runApp(MainApp());


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


