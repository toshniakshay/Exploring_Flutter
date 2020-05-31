class AppConstants {
  static const String DefaultRoute = "/";
  static const String EmailRoute = "/getEmail";
  static const String PasswordRoute = "/getPassword";
  static const String PersonalInfoRoute = "/getPersonalInformation";
  static const String ScheduleMeetingRoute = "/scheduleMeeting";
  static const String ProfilePageRoute = "/ProfilePage";

  static const String CreateAccount = "Create Account";
}

class ErrorConstants {
  static const String Error = "Error";
  static const String DefaultErrorRoute = "Page you are trying to find dose not exists or invalid";
}

class EmailConstants {
  static const String EmailDescription = "Welcome to the bank of Future.\nManage and track your users on the go.";
  static const String EmailLine1 = "Welcome to \nFlutter ";
  static const String EmailLine2 = "'Journey";
  static const String Email = "Email";

  static const String EmptyEmail = "Email address can't be empty";
  static const String InvalidEmail = "Invalid Email Address";

}

class PasswordConstants {
  static const String EmptyPassword = "Password Field can't be empty";
  static const String LengthError = "Password must contain more than 9 letters";
  static const String UppercaseError = "Password should atleast have one Uppercase case character";
  static const String LowercaseError = "Password should atleast have one Lowercase case character";
  static const String DigitError = "Password should atleast have one Digit";

  static const String CreatePassword = "Create Password";
  static const String CreatePasswordDesc = "Password will be used to login to account";
  static const String Complexity = "Complexity : ";
  static const String Weak = "Weak";
  static const String Good = "Good";
  static const String Strong = "Strong";

  static const String lowerCase = "a";
  static const String upperCase = "A";
  static const String number = "123";
  static const String pwdLength = "9+";

  static const String lowerCaseDesc = "Lowercase";
  static const String upperCaseDesc = "Uppercase";
  static const String numberDesc = "Number";
  static const String characterDesc = "Characters";
}

class PersonalInfoConstants {
  static const String ChooseOption = "- Choose Option -";
  static const String InvalidGoal = "Please select atleast one goal that you want to set";
  static const String InvalidIncome = "Please provide your monthly income";
  static const String InvalidExpense = "Please provide your monthly income";

  static const String PersonalInfo = "Personal Information";
  static const String PersonalInfoDesc = "Please fill in the information below and your goal for digital saving.";
  static const String GoalForActivation = "Goal for Activation";
  static const String YourGoals = "Your Goal";
  static const String MonthlyIncome = "Monthly Income";
  static const String MonthlyExpense = "Monthly Expenses";

}

class ScheduleMeetingCosntants {
  static const String ChooseDate = "- Choose Date -";
  static const String ChooseTime = "- Choose Time -";
  static const String ScheduleVideoCall = "Schedule Video Call";
  static const String SchVideoDesc = "Choose the date and time that you preferred, we will send you link via email to make video call on the scheduled date and time.";
  static const String Date = "Date";
  static const String Time = "Time";
  static const String DateError = "Please provide valid Date.";
  static const String TimeError = "Please provide valid Time.";
}