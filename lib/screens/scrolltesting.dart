import 'package:flutter/material.dart';

// ignore: camel_case_types
class scroll extends StatefulWidget {
  const scroll({super.key});

  @override
  State<scroll> createState() => _scrollState();
}

// ignore: camel_case_types
class _scrollState extends State<scroll> {
  ScrollController sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: TextFormField(
              scrollController: sc,
              expands: true,
              minLines: null,
              maxLines: null,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.amber,
                hintText: 'Add Text',
                hintStyle: TextStyle(color: Colors.grey),
              )),
        ),
      ),
    );
  }
}
