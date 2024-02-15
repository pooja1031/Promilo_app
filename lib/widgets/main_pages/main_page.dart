

import 'package:flutter/material.dart';
import 'package:proilo_app/widgets/main_pages/bottom_navigation.dart';
import 'package:proilo_app/screens/account.dart';
import 'package:proilo_app/screens/explore.dart';
import 'package:proilo_app/screens/home.dart';
import 'package:proilo_app/screens/meetup.dart';
import 'package:proilo_app/screens/prolet.dart';

// ignore: must_be_immutable
class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  List _pages = [
    MyHome(),
    Prolet(),
    SuccessfulLoginScreen(),
    Explore(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int value, _) {
            return _pages[value];
          },
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
