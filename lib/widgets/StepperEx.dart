import 'package:flutter/material.dart';
import 'package:userregistration/utils/Helper.dart';

class StepperEx extends StatelessWidget {
  final int currentState;
  final int _stepCount = 4;
  final double height;

  StepperEx({@required this.currentState, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        child: Row(
          children: getStepsForStepper(),
        ));
  }

  List<Widget> getStepsForStepper() {
    List<Widget> stepsList = List();

    for(int i=1; i<5; i++) {
      var color = i <= (currentState-1) ? Colors.green : Helper.getColorFromHex("EDEDEE");
      stepsList.add(getStepView(i, color));
      if(i<4) stepsList.add(getDivider());
    }

    return stepsList;
  }

  Widget getStepView(int i, color) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          i.toString(),
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  Widget getDivider() {
    return Container(
      width: 40.0,
      height: 1.5,
      color: Colors.black,
    );
  }
}
