import 'dart:io';

import 'package:flutter/material.dart';

class AddImageNotePage extends StatefulWidget {
  final String imagePath;
  const AddImageNotePage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<AddImageNotePage> createState() => _AddImageNotePageState();
}

class _AddImageNotePageState extends State<AddImageNotePage> {
  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController descriptionTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Image'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 40,
              child: Image.file(
                File(widget.imagePath),
                width: double.infinity,
              )),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                controller: titleTEController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: descriptionTEController,
                decoration: const InputDecoration(
                  hintText: 'Note',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
