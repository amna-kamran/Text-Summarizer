// ignore_for_file: camel_case_types, duplicate_ignore, prefer_final_fields, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summarizer/screens/navBar.dart';

// ignore: camel_case_types
class summarizer extends StatefulWidget {
  const summarizer({super.key});

  @override
  State<summarizer> createState() => _summarizerState();
}

class _summarizerState extends State<summarizer> {
  final items = ['en', 'fr', 'jp', 'du', 'ch'];
  String? value;
  TextEditingController _editTextController = TextEditingController();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          backgroundColor: const Color.fromARGB(255, 56, 20, 56),
          elevation: 0,
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Color.fromARGB(255, 56, 20, 56),
      //     elevation: 0.0,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_rounded,
      //           size: 34,
      //           color: Color.fromARGB(255, 241, 241, 241),
      //         ),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.folder_rounded,
      //           size: 30,
      //           color: Color.fromARGB(255, 241, 241, 241),
      //         ),
      //         label: 'File',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.person_rounded,
      //           size: 32,
      //           color: Color.fromARGB(255, 241, 241, 241),
      //         ),
      //         label: 'Profile',
      //       )
      //     ]),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 22, 8, 22),
          child: Column(
            children: [
              Container(
                //color: Color.fromARGB(255, 22, 8, 22).withOpacity(0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                      width: 100,
                      //color: Color.fromARGB(255, 255, 37, 164),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Length',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      width: 100,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 65, 24, 66),
                            hintText: "e.g 2",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 233, 233, 233),
                                fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 400,
                  margin: EdgeInsets.only(
                    //top: MediaQuery.of(context).size.height * 0.12,
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.01,
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 8, 22),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.8,
                                color: const Color.fromARGB(255, 250, 180, 0)),
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextFormField(
                          controller: _editTextController,
                          //scrollPadding: EdgeInsets.only(left: 20),
                          //expands: true,
                          textAlign: TextAlign.left,
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add Text',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 56, 56, 56),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: IconButton(
                                onPressed: (() {}),
                                iconSize: 32,
                                icon: const Icon(Icons.file_upload_outlined),
                                color:
                                    const Color.fromARGB(255, 255, 255, 119)),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: IconButton(
                              onPressed: (() {}),
                              iconSize: 35,
                              icon: const Icon(Icons.link),
                              color: const Color.fromARGB(255, 255, 255, 119),
                            ),
                          ),
                          const SizedBox(
                            width: 45,
                          ),
                          Container(
                            //color: Colors.amber,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height:
                                  MediaQuery.of(context).size.height * 0.052,
                              child: OutlinedButton(
                                onPressed: () {
                                  _editTextController.clear();
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  side: const BorderSide(
                                      width: 0.8,
                                      color: Color.fromARGB(255, 250, 180, 0)),
                                ),
                                child: const Text(
                                  'Clear',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Container(
                          //   //color: Colors.amber,
                          //   child: SizedBox(
                          //     width: MediaQuery.of(context).size.width * 0.28,
                          //     height: MediaQuery.of(context).size.height * 0.052,
                          //     child: OutlinedButton(
                          //       onPressed: () {},
                          //       style: OutlinedButton.styleFrom(
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(25.0),
                          //         ),
                          //         side: BorderSide(
                          //             width: 2,
                          //             color: Color.fromRGBO(109, 241, 180, 1)),
                          //       ),
                          //       child: Text(
                          //         'en',
                          //         style:
                          //             TextStyle(color: Colors.black, fontSize: 20),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.8,
                                    color:
                                        const Color.fromARGB(255, 250, 180, 0)),
                                color: const Color.fromARGB(255, 86, 32, 87),
                                borderRadius: BorderRadius.circular(25)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                hint: const Text(
                                  'Lang',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(20),
                                dropdownColor:
                                    const Color.fromARGB(255, 86, 32, 87),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                items: items.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value = value),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.008,
                    bottom: MediaQuery.of(context).size.height * 0.008),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.56,
                  height: MediaQuery.of(context).size.height * 0.052,
                  child: OutlinedButton(
                    onPressed: () {
                      bottomsheets(context);
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: const BorderSide(
                          width: 0.8,
                          color: Color.fromARGB(255, 109, 241, 180)),
                    ),
                    child: const Text(
                      'Summarize',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      );

  void bottomsheets(context) {
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 22, 8, 22),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.height * 100,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      margin: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextFormField(
                        controller: controller,
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add Text',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 56, 56, 56),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //color: Colors.amber,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: OutlinedButton(
                            onPressed: () {
                              controller.clear();
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                              side: const BorderSide(
                                width: 0.8,
                                color: Color.fromARGB(255, 255, 255, 119),
                              ),
                            ),
                            child: const Text(
                              'Reset',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 119),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() {}),
                          iconSize: 30,
                          icon: const Icon(Icons.translate),
                          color: const Color.fromARGB(255, 255, 255, 119),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() {}),
                          iconSize: 30,
                          icon: const Icon(Icons.backup_outlined),
                          color: const Color.fromARGB(255, 255, 255, 119),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() async {
                            await Clipboard.setData(
                                    const ClipboardData(text: 't'))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Copied to your clipboard !')));
                            });
                          }),
                          iconSize: 20,
                          icon: const Icon(Icons.content_copy),
                          color: const Color.fromARGB(255, 119, 133, 255),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() {}),
                          iconSize: 20,
                          icon: const Icon(Icons.content_cut),
                          color: const Color.fromARGB(255, 255, 255, 119),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() {}),
                          iconSize: 25,
                          icon: const Icon(Icons.arrow_downward),
                          color: const Color.fromARGB(255, 255, 255, 119),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
