import 'package:flutter/material.dart';
import 'package:notes/noteModel.dart';
import 'package:notes/widgets/add_button_widget.dart';
import 'package:notes/widgets/more_button_widget.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key, required this.onAddTap});

  final void Function(Note) onAddTap;

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController descriptionTEController = TextEditingController();

  Color? selectedColor = Colors.white;

  final List<Color> colorList = [
    Colors.white,
    Colors.red.shade100,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.yellow.shade100,
    Colors.orange.shade100,
    Colors.deepPurple.shade100,
    Colors.teal.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade200,
    Colors.blue.shade100,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.push_pin_outlined),
                      // ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          Note note = Note(
                            title: titleTEController.text.trim(),
                            description: descriptionTEController.text.trim(),
                            bgColor: selectedColor ?? Colors.white,
                          );
                          widget.onAddTap(note);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.done),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: titleTEController,
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
                                return const AddButtonWidget();
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
                          return const MoreButtonWidget();
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

  @override
  void dispose() {
    titleTEController.dispose();
    descriptionTEController.dispose();
    super.dispose();
  }
}
