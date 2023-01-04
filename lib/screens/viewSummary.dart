import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../customWidgets/box.dart';
import 'NavBar.dart';
import 'package:summarizer/models/summary.dart';

class viewSummary extends StatefulWidget {
  const viewSummary({super.key});

  @override
  State<viewSummary> createState() => _viewSummaryState();
}

class _viewSummaryState extends State<viewSummary> {
  List<Object> _summaryList = [];
  final FirebaseAuth auth = FirebaseAuth.instance;
  void didChangeDependencies() {
    super.didChangeDependencies();
    getSummaryQuestionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 8, 22),
      drawer: NavBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              iconSize: 35,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 56, 20, 56),
          elevation: 0,
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: _summaryList.length,
        itemBuilder: (context, index) {
          return box(_summaryList[index] as summary);
        },
      )),
    );
  }

  Future getSummaryQuestionList() async {
    final uid = auth.currentUser?.uid;
    var data = await FirebaseFirestore.instance
        .collection('summaries')
        // .orderBy('created', descending: true)
        .get();

    setState(() {
      _summaryList =
          List.from(data.docs.map((doc) => summary.fromSnapshot(doc)));
    });
  }
}
