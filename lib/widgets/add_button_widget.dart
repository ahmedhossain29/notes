import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.add_a_photo_outlined),
            title: Text('Take photo'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.image_outlined),
            title: Text('Add image'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.brush),
            title: Text('Drawing'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.mic_none),
            title: Text('Recording'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.check_box_outlined),
            title: Text('Checkboxes'),
          ),
        ),
      ],
    );
  }
}
