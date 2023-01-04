import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import '../util/ocr.dart';

class ImageToText extends StatefulWidget {
  const ImageToText({super.key});

  @override
  State<ImageToText> createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {
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
        outputText += "${block.text}\n";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image to Text")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickImage(ImageSource.gallery, pickedImage);
        },
        child: const Icon(Icons.image),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(children: [
          if (_pickedImage == null)
            Container(
              height: 600,
              color: Colors.black,
              width: double.infinity,
            )
          else
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.file(
                _pickedImage!,
                fit: BoxFit.fill,
              ),
            ),
          Expanded(child: Container()),
          Text(
            outputText,
            style: const TextStyle(fontSize: 24),
          ),
          Expanded(child: Container()),
        ]),
      ),
    );
  }
}
