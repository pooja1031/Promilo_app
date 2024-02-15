import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

//
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          selectedIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              label: "Prolet",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.handshake_outlined,
              ),
              label: "Meet Ups",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Account",
            ),
          ],
        );
      },
    );
  }
}
