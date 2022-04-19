// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_paper/presentation/pages/login_page/widgets/global_button.dart';
import 'package:news_paper/presentation/pages/login_page/widgets/login_button.dart';
import 'package:news_paper/presentation/pages/settings_page/widgets/page_button.dart';
import 'package:news_paper/presentation/pages/splash_page/splash_page.dart';
import 'package:news_paper/presentation/widgets/custom_text_field.dart';
import 'package:news_paper/presentation/widgets/news_card.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

final Store<AppState> store = Store<AppState>(
  AppState.getReducer,
  initialState: AppState.initial(),
  middleware: [
    EpicMiddleware(AppState.getAppEpic),
  ],
);

void main() {
  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });
  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      const NewsCard(
          fontSize: 1,
          light: true,
          titleNews: 'News',
          link:
              'https://i.guim.co.uk/img/media/6a37527c1d124bb06f75f81e34fec153cf7145b1/0_0_4000_2400/master/4000.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctZGVmYXVsdC5wbmc&enable=upscale&s=9c45c05ee1d6ee2e6e4f77ecf928b637'),
    );
    var image = find.byType(FadeInImage);
    expect(image, findsOneWidget);

    print('Image Work');
    final titleFinder = find.text('News');
    expect(titleFinder, findsOneWidget);
    print('Image Work');
  });
  testWidgets("AboutUs Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashPage()));
    print('Spalash');
  });
  testWidgets("Button Page Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonPage(
            rowText: 'xtx',
            fontSize: 1,
            light: true,
            rowIcon: CupertinoIcons.forward,
            onTap: () {},
          ),
        ),
      ),
    );
    final titleFinder = find.text('xtx');
    expect(titleFinder, findsOneWidget);

    print('Button');
  });
  //GlobalButton
  testWidgets("Global Button Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GlobalButton(
            text: 'xtx',
            fontSize: 1,
            onTap: () {},
          ),
        ),
      ),
    );
    final titleFinder = find.text('xtx');
    expect(titleFinder, findsOneWidget);

    print('Global Button');
  });

  testWidgets("Login Button Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginButton(
            function: () {

            },
            hintTextStyle: AppFonts.buttonLogReg,
            image: googleLogo,
            padding: 20.0,
            onTap: true,
            textR: 'singUp',
            textS: 'singIn',
          ),
        ),
      ),
    );
    final titleFinder = find.text('singIn');
    expect(titleFinder, findsOneWidget);

    print('Login Button');
  });
  testWidgets("Text Field Test", (WidgetTester tester) async {
    final TextEditingController _passwordController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppTextField(
            keyValue: 'keyLoginTest',
            controller: _passwordController,
          ),
        ),
      ),
    );

    var textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Flutter Devs');
    expect(find.text('Flutter Devs'), findsOneWidget);
    print('Text Field');
  });
}
