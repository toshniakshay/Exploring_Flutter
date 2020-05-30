import 'package:flutter/material.dart';
import 'package:userregistration/application/AppConstants.dart';
import 'package:userregistration/application/colors.dart';
import 'package:userregistration/enums/PersonalInfo.dart';
import 'package:userregistration/utils/Helper.dart';
import 'package:userregistration/utils/Validator.dart';
import 'package:userregistration/widgets/BottomSheet.dart';
import 'package:userregistration/widgets/CustomBox.dart';
import 'package:userregistration/widgets/CustomListWidget.dart';
import 'package:userregistration/widgets/StepperEx.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  String _goalForActivation = PersonalInfoConstants.ChooseOption;
  String _monthlyIncome = PersonalInfoConstants.ChooseOption;
  String _monthlyExpense = PersonalInfoConstants.ChooseOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Helper.getColorFromHex(AppColors.AppBgColor),
            title: new Text(AppConstants.CreateAccount),
            elevation: 0.0,
          ),
          preferredSize: Size.fromHeight(40.0)),
      backgroundColor: Helper.getColorFromHex(AppColors.AppBgColor),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[StepperEx(height: 100.0, currentState: 3)],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    PersonalInfoConstants.PersonalInfo,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    PersonalInfoConstants.PersonalInfoDesc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 60, right: 10),
                  child: CustomBoxWidget(
                    boxHeader: PersonalInfoConstants.GoalForActivation,
                    selectedOption: _goalForActivation,
                    onClickAction: () {
                      _showOptions(
                          context,
                          Helper.getGoalsForActivation(),
                          PersonalInfoConstants.YourGoals,
                          PersonalInfo.GOAL_FOR_ACTIVATION);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 30, right: 10),
                  child: CustomBoxWidget(
                    boxHeader: PersonalInfoConstants.MonthlyIncome,
                    selectedOption: _monthlyIncome,
                    onClickAction: () {
                      _showOptions(
                          context,
                          Helper.getMonthlyIncomeList(),
                          PersonalInfoConstants.MonthlyExpense,
                          PersonalInfo.MONTHLY_INCOME);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 30, right: 10),
                  child: CustomBoxWidget(
                    boxHeader: PersonalInfoConstants.MonthlyExpense,
                    selectedOption: _monthlyExpense,
                    onClickAction: () {
                      _showOptions(
                          context,
                          Helper.getMonthlyExpenseList(),
                          PersonalInfoConstants.MonthlyExpense,
                          PersonalInfo.MONTHLY_EXPENSES);
                    },
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
    String result = Validator.validatePersonalInfo(
        _goalForActivation, _monthlyIncome, _monthlyExpense);

    // There are some issues with validation
    if (result == null) {
      Navigator.of(context).pushNamed(AppConstants.ScheduleMeetingRoute);
    } else {
      Helper.showErrorDialog(
          context,
          Validator.validatePersonalInfo(
              _goalForActivation, _monthlyIncome, _monthlyExpense));
    }
  }

  /// Same method will be used to show dialog for all the options
  void _showOptions(BuildContext context, List<String> optionsList,
      String title, PersonalInfo personalInfo) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ListWidget(
            optionsList: optionsList,
            dialogTitle: title,
            getSelectedItem: (item) =>
                {setPersonalInformation(item, personalInfo)},
          );
        });
  }

  /// Update the value in the dropdown
  void setPersonalInformation(item, PersonalInfo personalInfo) {
    // Dismiss dialog
    Navigator.of(context, rootNavigator: true).pop(true);

    setState(() {
      switch (personalInfo) {
        case PersonalInfo.GOAL_FOR_ACTIVATION:
          _goalForActivation = item;
          break;
        case PersonalInfo.MONTHLY_INCOME:
          _monthlyIncome = item;
          break;
        case PersonalInfo.MONTHLY_EXPENSES:
          _monthlyExpense = item;
          break;
      }
    });
  }
}
