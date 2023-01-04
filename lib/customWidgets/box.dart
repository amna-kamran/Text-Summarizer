import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:summarizer/screens/display.dart';

import '../models/summary.dart';

// ignore: camel_case_types
class box extends StatelessWidget {
  final summary _summary;
  box(this._summary);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.amber,
      onTap: (() {
        Navigator.push(
            context,
            PageTransition(
                child: MyWidget(_summary),
                type: PageTransitionType.rightToLeft));
      }),
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.height * 0.017,
          right: MediaQuery.of(context).size.height * 0.017,
          bottom: MediaQuery.of(context).size.height * 0.001,
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 69, 55, 100),
            borderRadius: BorderRadius.circular(25)),
        height: 120,
        width: 160,
        child: Padding(
          padding: EdgeInsets.only(left: 18, top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 30,
                  width: 100,
                  //color: Colors.amber,
                  child: Text(
                    "Untitled",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                height: 60,
                width: 350,
                //color: Colors.red,
                child: Padding(
                    padding: EdgeInsets.only(right: 15, bottom: 12, top: 5),
                    child: Text(
                      "${_summary.text}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
