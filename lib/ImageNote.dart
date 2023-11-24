import 'dart:io';

import 'package:flutter/material.dart';

class ImageNote extends StatefulWidget {
  final String Imageurl;
  const ImageNote({super.key, required this.Imageurl});

  @override
  State<ImageNote> createState() => _ImageNoteState();
}

class _ImageNoteState extends State<ImageNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Note'),
      ),
      body: Column(
        children: [
          Image.file(
            File(widget.Imageurl),
          )
        ],
      ),
    );
  }
}
