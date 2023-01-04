import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:summarizer/screens/navBar.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import '../util/ocr.dart';
import 'dart:io';

class imgtotext extends StatefulWidget {
  const imgtotext({super.key});

  @override
  State<imgtotext> createState() => _imgtotextState();
}

// ignore: camel_case_types
class _imgtotextState extends State<imgtotext> {
  TextAlign textAlign = TextAlign.center;
  EdgeInsets padding = const EdgeInsets.fromLTRB(130.0, 100.0, 20.0, 10.0);
  String outputText = "";
  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: outputText);
  }

  String displayText = "";
  File? _pickedImage;

  pickedImage(File file) {
    setState(() {
      _pickedImage = file;
    });

    InputImage inputImage = InputImage.fromFile(file);
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
        outputText += "${block.text}\n";
      });
    }
    setState(() {
      textController = TextEditingController(text: outputText);
    });
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormBuilderState>();
    const snackBar = SnackBar(content: Text('Data Added!'));
    CollectionReference summaries =
        FirebaseFirestore.instance.collection('summaries');

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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 22, 8, 22),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      highlightColor: Colors.amber,
                      onTap: (() {
                        pickImage(ImageSource.gallery, pickedImage);
                      }),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.height * 0.01,
                          right: MediaQuery.of(context).size.height * 0.01,
                        ),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/pinkbox.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(25)),
                        height: 50,
                        width: 160,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Upload an Image',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.height * 0.01,
                          right: MediaQuery.of(context).size.height * 0.01,
                        ),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/greenbox.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(25)),
                        height: 50,
                        width: 160,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Take a Picture',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(children: [
                  if (_pickedImage == null)
                    Container(
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.image,
                            size: 80,
                            color: Colors.white24,
                          )),
                    )
                  else
                    Container(
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.file(
                        _pickedImage!,
                      ),
                    ),
                ]),
                Container(
                  height: 250,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.4,
                          color: const Color.fromARGB(255, 250, 180, 0)),
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: padding,
                    child: TextFormField(
                      controller: textController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            outputText += value;
                            padding = const EdgeInsets.only(
                                top: 10, bottom: 0, left: 20);
                          });
                        } else if (value.isEmpty) {
                          setState(() {
                            padding = const EdgeInsets.fromLTRB(
                                130.0, 100.0, 20.0, 10.0);
                          });
                        }
                      },
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                      ),
                      expands: true,
                      minLines: null,
                      maxLines: null,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add Text',
                          hintStyle: TextStyle(color: Colors.white)),
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
                            side: const BorderSide(
                                width: 0.4,
                                color: Color.fromARGB(255, 250, 180, 0)),
                          ),
                          child: const Text(
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
                    const SizedBox(
                      width: 160,
                    ),
                    IconButton(
                      onPressed: (() async {
                        await summaries.add({
                          'title': 'untitled',
                          'summary': outputText,
                          'created': Timestamp.now()
                        });

                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Success!',
                            message: 'Data has been stored!',

                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                            contentType: ContentType.success,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }),
                      iconSize: 25,
                      icon: const Icon(Icons.arrow_upward),
                      color: Color.fromARGB(255, 80, 151, 163),
                    ),
                    IconButton(
                      onPressed: (() {}),
                      iconSize: 20,
                      icon: const Icon(Icons.content_copy),
                      color: Color.fromARGB(255, 151, 150, 150),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    IconButton(
                      onPressed: (() {}),
                      iconSize: 25,
                      icon: const Icon(Icons.arrow_downward),
                      color: Color.fromARGB(255, 151, 150, 150),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
