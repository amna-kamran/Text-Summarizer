import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:summarizer/screens/navBar.dart';
import 'package:summarizer/screens/summarizer.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import '../util/ocr.dart';
import 'dart:io';

class imgtotext extends StatefulWidget {
  imgtotext({super.key});

  @override
  State<imgtotext> createState() => _imgtotextState();
}

class _imgtotextState extends State<imgtotext> {
  TextAlign textAlign = TextAlign.center;
  EdgeInsets padding = EdgeInsets.fromLTRB(130.0, 100.0, 20.0, 10.0);
  final TextEditingController textController = TextEditingController();
  String displayText = "";
  //////////////////////////////////////////////////////////////////////////////
  File? _pickedImage;
  String outputText = "";
  pickedImage(File file) {
    setState(() {
      _pickedImage = file;
    });

    InputImage inputImage = InputImage.fromFile(file);
    //code to recognize image
    processImageForConversion(inputImage);
  }

  processImageForConversion(inputImage) async {
    setState(() {
      outputText = "";
    });

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    for (TextBlock block in recognizedText.blocks) {
      setState(() {
        outputText += block.text + "\n";
      });
    }
  }

  ////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormBuilderState>();
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
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.amber,
                  onTap: (() {
                    pickImage(ImageSource.gallery, pickedImage);
                    print('hehehe');
                  }),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Upload an Image',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      //top: MediaQuery.of(context).size.height * 0.12,
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/pinkbox.png'),
                          fit: BoxFit.cover,
                        ),
                        //color: Color.fromARGB(255, 76, 117, 88),
                        borderRadius: BorderRadius.circular(25)),
                    height: 50,
                    width: 160,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: (() {
                    //print('hehehe');
                  }),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Take a Picture',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      //top: MediaQuery.of(context).size.height * 0.12,
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/greenbox.png'),
                          fit: BoxFit.cover,
                        ),
                        //color: Color.fromARGB(255, 76, 117, 88),
                        borderRadius: BorderRadius.circular(25)),
                    height: 50,
                    width: 160,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(children: [
              if (_pickedImage == null)
                Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.image,
                        size: 80,
                        color: Colors.white24,
                      )),
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)),
                )
              else
                Container(
                  height: 250,
                  width: 350,
                  child: Image.file(
                    _pickedImage!,
                    //fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)),
                ),
            ]),
            Container(
              height: 250,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.4, color: Color.fromARGB(255, 250, 180, 0)),
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: padding,
                child: TextFormField(
                  controller: TextEditingController(text: outputText),

                  //textAlign: textAlign,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        //textAlign = TextAlign.left;
                        padding = EdgeInsets.only(top: 10, bottom: 0, left: 20);
                      });
                    } else if (value.isEmpty) {
                      setState(() {
                        //textAlign = TextAlign.center;
                        padding = EdgeInsets.fromLTRB(130.0, 100.0, 20.0, 10.0);
                      });
                    }
                  },
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                  ),
                  expands: true,
                  //textAlign: TextAlign.left,
                  minLines: null,
                  maxLines: null,
                  //keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Scanned Text',
                    hintStyle: TextStyle(
                      color: Colors.white24,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015,
                  ),
                  //color: Colors.amber,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.21,
                    height: MediaQuery.of(context).size.height * 0.050,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        side: BorderSide(
                            width: 0.4,
                            color: Color.fromARGB(255, 250, 180, 0)),
                      ),
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                ),
                Container(
                  child: IconButton(
                    onPressed: (() {}),
                    iconSize: 20,
                    icon: Icon(Icons.content_copy),
                    color: Colors.white12,
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
                    color: Colors.white12,
                  ),
                ),
              ],
            ),
            FormBuilder(
              key: _formkey,
              child: FormBuilderTextField(name: "summarizer"),
            )
          ]),
        ),
      )),
    );
  }
}
