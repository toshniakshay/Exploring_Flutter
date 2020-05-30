import 'package:flutter/material.dart';
import 'package:userregistration/application/AppConstants.dart';
import 'package:userregistration/application/colors.dart';
import 'package:userregistration/utils/Helper.dart';
import 'package:userregistration/widgets/BottomSheet.dart';
import 'package:userregistration/widgets/CustomBox.dart';
import 'package:userregistration/widgets/StepperEx.dart';

class ScheduleMeetingScreen extends StatefulWidget {
  @override
  _ScheduleMeetingScreenState createState() => _ScheduleMeetingScreenState();
}

class _ScheduleMeetingScreenState extends State<ScheduleMeetingScreen> {
  String selectedDate = ScheduleMeetingCosntants.ChooseDate;
  String selectedTime = ScheduleMeetingCosntants.ChooseTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AppBar(
        backgroundColor: Helper.getColorFromHex(AppColors.AppBgColor),
        title: new Text(AppConstants.CreateAccount),
        elevation: 0.0,
      ), preferredSize: Size.fromHeight(40.0)),
      backgroundColor: Helper.getColorFromHex(AppColors.AppBgColor),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[StepperEx(height:100.0,currentState: 4)],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image(
                            image: AssetImage("images/calendar.png"),
                            width: 30.0,
                            fit: BoxFit.fitWidth,
                            height: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    ScheduleMeetingCosntants.ScheduleVideoCall,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    ScheduleMeetingCosntants.SchVideoDesc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 60, right: 10),
                  child: CustomBoxWidget(
                    boxHeader: ScheduleMeetingCosntants.Date,
                    selectedOption: selectedDate,
                    onClickAction: () => {_showDatePicket(context)},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 30, right: 10),
                  child: CustomBoxWidget(
                    boxHeader: ScheduleMeetingCosntants.Time,
                    selectedOption: selectedTime,
                    onClickAction: () => {_showTimePicker(context)},
                  ),
                ),
              ],
            ),
          ),
          BottomSheetEx(
              btnTextColor: Colors.blue,
              buttonColor: Colors.white,
              nextButtonAction: () => {onNextButtonClick(context)})
        ],
      ),
    );
  }

  onNextButtonClick(BuildContext context) {
    if (selectedDate == ScheduleMeetingCosntants.ChooseDate) {
      Helper.showErrorDialog(context, ScheduleMeetingCosntants.DateError);
    } else if (selectedTime == ScheduleMeetingCosntants.ChooseTime) {
      Helper.showErrorDialog(context, ScheduleMeetingCosntants.TimeError);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, AppConstants.DefaultRoute, (r) => false);
    }
  }

  Future<Null> _showDatePicket(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
        firstDate: DateTime.now(),
        lastDate: DateTime(
            DateTime.now().year + 1, DateTime.now().month, DateTime.now().day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = Helper.getDateInReadableFormat(picked.toString());
      });
  }

  Future<Null> _showTimePicker(BuildContext context) async {
    TimeOfDay timepick = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());

    if (timepick != null) {
      setState(() {
        selectedTime = timepick.toString().substring(10, 15);
      });
    }
  }
}
