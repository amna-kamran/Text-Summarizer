import 'package:flutter/material.dart';
import 'package:summarizer/screens/summarizer.dart';
import 'package:summarizer/screens/viewSummary.dart';
import 'package:summarizer/screens/welcomescreen.dart';
import 'imageToTextScreen.dart';

// ignore: camel_case_types
class staticbar extends StatefulWidget {
  const staticbar({super.key});

  @override
  State<staticbar> createState() => _staticbarState();
}

// ignore: camel_case_types
class _staticbarState extends State<staticbar> {
  int index = 0;
  final screens = [
    const summarizer(),
    const imgtotext(),
    viewSummary(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.amber,
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
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
            backgroundColor: const Color.fromARGB(255, 22, 8, 22),
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.home_rounded,
                    size: 28,
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Icons.person_rounded,
                    size: 26,
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  label: 'Img to Txt'),
              NavigationDestination(
                  icon: Icon(
                    Icons.folder_rounded,
                    size: 24,
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  label: 'File'),
            ]),
      ),
    );
  }
}
