import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_learn/app/app.dart';

void main() {
  testWidgets('Calculator test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const myApp());

    // Ensure that the key "Result" is found
    expect(find.byKey(const Key("Result")), findsOneWidget);

    // Ensure that the keys "DisplayOne" and "DisplayTwo" are found
    expect(find.byKey(const Key("DisplayOne")), findsOneWidget);
    expect(find.byKey(const Key("DisplayTwo")), findsOneWidget);

    // Ensure that the icons are found
    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

    // Enter text into the text fields
    await tester.enterText(find.byKey(const Key("DisplayOne")), "20");
    await tester.enterText(find.byKey(const Key("DisplayTwo")), "10");

    // Tap the add icon and verify the result
    await tester.tap(find.byIcon(CupertinoIcons.add));
    await tester.pump();

    expect(find.text("30"), findsOneWidget);

    // Tap the minus icon and verify the result
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    expect(find.text("10"), findsNWidgets(2));

    // Tap the multiply icon and verify the result
    await tester.tap(find.byIcon(CupertinoIcons.multiply));
    await tester.pump();

    expect(find.text("200"), findsOneWidget);

    // Tap the divide icon and verify the result
    await tester.tap(find.byIcon(CupertinoIcons.divide));
    await tester.pump();

    expect(find.text("2.0"), findsOneWidget);
  });
}
