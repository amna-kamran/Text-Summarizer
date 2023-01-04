import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:summarizer/models/summary.dart';

class MyWidget extends StatelessWidget {
  final summary _summary;
  MyWidget(this._summary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 10),
        child: TextFormField(
          controller: TextEditingController(text: _summary.text),
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }
}
