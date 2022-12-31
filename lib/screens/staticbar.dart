import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:summarizer/screens/summarizer.dart';
import 'package:summarizer/screens/welcomescreen.dart';
import 'imageToTextScreen.dart';

class staticbar extends StatefulWidget {
  const staticbar({super.key});

  @override
  State<staticbar> createState() => _staticbarState();
}

class _staticbarState extends State<staticbar> {
  int index = 0;
  final screens = [
    summarizer(),
    imgtotext(),
    welcomescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.amber,
            labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white))),
        child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) {
              setState(() {
                this.index = index;
              });
            },
            height: 75,
            backgroundColor: Color.fromARGB(255, 22, 8, 22),
            destinations: [
              NavigationDestination(
                  icon: Icon(
                    Icons.home_rounded,
                    size: 28,
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Icons.folder_rounded,
                    size: 24,
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  label: 'File'),
              NavigationDestination(
                  icon: Icon(
                    Icons.person_rounded,
                    size: 26,
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  label: 'Profile'),
            ]),
      ),
      // body: PersistentTabView(
      //   backgroundColor: Color.fromARGB(255, 56, 20, 56),
      //   navBarStyle: NavBarStyle.style13,
      //   context,
      //   screens: [
      //     summarizer(),
      //     imgtotext(),
      //     summarizer(),
      //   ],
      //   items: [
      //     PersistentBottomNavBarItem(
      //       icon: Icon(
      //         Icons.home_rounded,
      //         size: 34,
      //         color: Color.fromARGB(255, 241, 241, 241),
      //       ),
      //       title: 'Home',
      //       activeColorPrimary: Color.fromARGB(255, 255, 255, 255),
      //       inactiveColorPrimary: Colors.amber,
      //     ),
      //     PersistentBottomNavBarItem(
      //       icon: Icon(
      //         Icons.folder_rounded,
      //         size: 30,
      //         color: Color.fromARGB(255, 241, 241, 241),
      //       ),
      //       title: 'File',
      //     ),
      //     PersistentBottomNavBarItem(
      //       icon: Icon(
      //         Icons.person_rounded,
      //         size: 32,
      //         color: Color.fromARGB(255, 241, 241, 241),
      //       ),
      //       title: 'Profile',
      //     )
      //   ],
      // ),
    );
  }
}
