import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:userregistration/application/AppConstants.dart';
import 'package:userregistration/pages/InputEmailScreen.dart';
import 'package:userregistration/pages/InputPasswordScreen.dart';
import 'package:userregistration/utils/Validator.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {

  NavigatorObserver mockObserver;
  group("Email Page Navigation Test", () {

    setUp(() => mockObserver = MockNavigatorObserver());
  });

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
      //navigatorObservers: [mockObserver],
    );
  }

  testWidgets("Testcase for Email Screen", (WidgetTester tester) async {
    InputEmailScreen emailScreen = InputEmailScreen();
    String emailAddress = "toshniwalakshay2@gmail.com";
    String invalidEmail = "akshaytoshniwal.com";

    await tester.pumpWidget(makeTestableWidget(child: emailScreen));

    Finder emailFieldFinder = find.byKey(Key('email'));

    await tester.enterText(emailFieldFinder, invalidEmail);
    expect(find.text(invalidEmail), findsOneWidget);
    expect(Validator.validateEmail(invalidEmail), EmailConstants.InvalidEmail);

    await tester.enterText(emailFieldFinder, emailAddress);
    expect(find.text(emailAddress), findsOneWidget);
    expect(Validator.validateEmail(emailAddress), null);

//    await tester.tap(find.byKey(Key("NextBtn")));
//    verify(mockObserver.didPush(any, any));

    // await tester.pumpAndSettle();
  });
}
