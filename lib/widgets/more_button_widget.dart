import 'package:flutter/material.dart';

class MoreButtonWidget extends StatelessWidget {
  const MoreButtonWidget({
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
            leading: Icon(Icons.delete_forever_outlined),
            title: Text('Delete'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.copy_rounded),
            title: Text('Make a copy'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.share),
            title: Text('Send'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.person_add_alt_outlined),
            title: Text('Collaborator'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.label_outline),
            title: Text('Labels'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            leading: Icon(Icons.help_outline_outlined),
            title: Text('Help & feedback'),
          ),
        ),
      ],
    );
  }
}
