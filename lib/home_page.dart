import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  File? imageFile;

  void _getFromCamera () async {
    XFile? imagePecker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(imagePecker!.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 50,),
            imageFile != null ?
                Container(
                 child: Image.file(imageFile!),
                ) :
                Container(
                  child: Icon(Icons.camera_alt,color: Colors.black26,size: MediaQuery.of(context).size.width * 1,),
                ),

            Padding(
              padding: EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: (){
                  _getFromCamera();
              },
               child: Text('Image with camera'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16,color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
      ),
    );
  }
}
