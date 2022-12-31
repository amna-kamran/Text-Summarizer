import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:summarizer/screens/navBar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.more_vert_rounded),
              iconSize: 35,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 56, 20, 56),
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
          color: Color.fromARGB(255, 22, 8, 22),
          child: Column(
            children: [
              Container(
                //color: Color.fromARGB(255, 22, 8, 22).withOpacity(0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                    Container(
                      height: 48,
                      width: 100,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              top: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 65, 24, 66),
                            hintText: "e.g 2",
                            hintStyle: TextStyle(
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
                      color: Color.fromARGB(255, 22, 8, 22),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        margin: EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.8,
                                color: Color.fromARGB(255, 250, 180, 0)),
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: TextFormField(
                          controller: _editTextController,
                          //scrollPadding: EdgeInsets.only(left: 20),
                          //expands: true,
                          textAlign: TextAlign.left,
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
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
                                icon: Icon(Icons.file_upload_outlined),
                                color: Color.fromARGB(255, 255, 255, 119)),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: IconButton(
                              onPressed: (() {}),
                              iconSize: 35,
                              icon: Icon(Icons.link),
                              color: Color.fromARGB(255, 255, 255, 119),
                            ),
                          ),
                          SizedBox(
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
                                  side: BorderSide(
                                      width: 0.8,
                                      color: Color.fromARGB(255, 250, 180, 0)),
                                ),
                                child: Text(
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
                          SizedBox(width: 8),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            margin: EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.8,
                                    color: Color.fromARGB(255, 250, 180, 0)),
                                color: Color.fromARGB(255, 86, 32, 87),
                                borderRadius: BorderRadius.circular(25)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                hint: Text(
                                  'Lang',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(20),
                                dropdownColor: Color.fromARGB(255, 86, 32, 87),
                                icon: Icon(
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
                      side: BorderSide(
                          width: 0.8,
                          color: Color.fromARGB(255, 109, 241, 180)),
                    ),
                    child: Text(
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
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      );

  void bottomsheets(context) {
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 22, 8, 22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 100,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      margin:
                          EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: TextFormField(
                        controller: controller,
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
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
                              side: BorderSide(
                                width: 0.8,
                                color: Color.fromARGB(255, 255, 255, 119),
                              ),
                            ),
                            child: Text(
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() {}),
                          iconSize: 30,
                          icon: Icon(Icons.translate),
                          color: Color.fromARGB(255, 255, 255, 119),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() {}),
                          iconSize: 30,
                          icon: Icon(Icons.backup_outlined),
                          color: Color.fromARGB(255, 255, 255, 119),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() async {
                            await Clipboard.setData(
                                    new ClipboardData(text: 't'))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Copied to your clipboard !')));
                            });
                          }),
                          iconSize: 20,
                          icon: Icon(Icons.content_copy),
                          color: Color.fromARGB(255, 119, 133, 255),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() {}),
                          iconSize: 20,
                          icon: Icon(Icons.content_cut),
                          color: Color.fromARGB(255, 255, 255, 119),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (() {}),
                          iconSize: 25,
                          icon: Icon(Icons.arrow_downward),
                          color: Color.fromARGB(255, 255, 255, 119),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
