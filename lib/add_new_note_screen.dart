import 'package:flutter/material.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  Color? selectedColor;

  final List<Color> colorList = [
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor ?? Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.push_pin_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_alert_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.archive_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 20),
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Note',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: const ListTile(
                                        leading:
                                            Icon(Icons.add_a_photo_outlined),
                                        title: Text('Take photo'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const ListTile(
                                        leading: Icon(Icons.image_outlined),
                                        title: Text('Add image'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const ListTile(
                                        leading: Icon(Icons.brush),
                                        title: Text('Drawing'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const ListTile(
                                        leading: Icon(Icons.mic_none),
                                        title: Text('Recording'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const ListTile(
                                        leading: Icon(Icons.check_box_outlined),
                                        title: Text('Checkboxes'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.add_box_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Color',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 100,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: colorList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    _onColorSelected(
                                                        colorList[index]);
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    margin:
                                                        const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: colorList[index],
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: selectedColor ==
                                                            colorList[index]
                                                        ? const Icon(
                                                            Icons.done,
                                                            color: Colors.black,
                                                          )
                                                        : null,
                                                  ),
                                                );
                                              }),
                                        ),
                                        const Text(
                                          'Background',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 100,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 10,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return Container(
                                                  width: 50,
                                                  height: 50,
                                                  margin:
                                                      const EdgeInsets.all(8),
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.blue),
                                                  child: Text(
                                                    'Color ${index + 1}',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.color_lens_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.text_format,
                          color: Colors.grey,
                        ),
                      ),
                      const Text('Edited 12.25 PM'),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const ListTile(
                                  leading: Icon(Icons.delete_forever_outlined),
                                  title: Text('Delete'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const ListTile(
                                  leading: Icon(Icons.copy_rounded),
                                  title: Text('Make a copy'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text('Send'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const ListTile(
                                  leading: Icon(Icons.person_add_alt_outlined),
                                  title: Text('Collaborator'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const ListTile(
                                  leading: Icon(Icons.label_outline),
                                  title: Text('Labels'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const ListTile(
                                  leading: Icon(Icons.help_outline_outlined),
                                  title: Text('Help & feedback'),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onColorSelected(Color color) {
    setState(() {
      selectedColor = color;
    });
  }
}
