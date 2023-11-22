import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final TextEditingController _textField1Controller = TextEditingController();
  final TextEditingController _textField2Controller = TextEditingController();

  Future<void> _showImageDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Image'),
          content: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _takePhoto();
                  Navigator.pop(context);
                },
                child: Text('Take Photo'),
              ),
              ElevatedButton(
                onPressed: () {
                  _chooseImage();
                  Navigator.pop(context);
                },
                child: Text('Choose Image'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _chooseImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(
                    _image!,
                    height: 300,
                    width: double.infinity,
                  ),
            ElevatedButton(
              onPressed: _showImageDialog,
              child: const Text('Select Image'),
            ),
            // if (_image != null) ...[
            //   Image.file(
            //     _image!,
            //     height: 400,
            //     width: double.infinity,
            //   ),
            SizedBox(height: 20),
            TextField(
              controller: _textField1Controller,
              decoration: InputDecoration(labelText: 'Textfield 1'),
            ),
            TextField(
              controller: _textField2Controller,
              decoration: InputDecoration(labelText: 'Textfield 2'),
            ),
          ],
        ),
      ),
    );
  }
}
