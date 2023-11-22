import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late ImagePicker _imagePicker;
  String? _selectedImagePath;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _showImageDialog() async {
    final result = AlertDialog(
      title: const Text('Add Image'),
      content: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final image =
                  await _imagePicker.pickImage(source: ImageSource.camera);
              if (image != null) {
                setState(() {
                  _selectedImagePath = image.path;
                });
                _showDetailsScreen();
              }
            },
            child: Text('Take Photo'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final image =
                  await _imagePicker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  _selectedImagePath = image.path;
                });
                _showDetailsScreen();
              }
            },
            child: Text('Choose Image'),
          ),
        ],
      ),
    );

    if (result == 'dismiss') {
      // Handle dismissal if needed
    }
  }

  void _showDetailsScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsScreen(imagePath: _selectedImagePath!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Expanded(
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check_box_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.brush),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic_none),
                ),
                IconButton(
                  onPressed: () {
                    _showImageDialog;
                  },
                  icon: const Icon(Icons.image_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String imagePath;

  const DetailsScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Details'),
      ),
      body: Column(
        children: [
          Image.file(File(imagePath)),
          TextField(
            decoration: InputDecoration(labelText: 'Enter text 1'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Enter text 2'),
          ),
        ],
      ),
    );
  }
}
