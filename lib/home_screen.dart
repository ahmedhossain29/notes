import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/update_note_screen.dart';
import 'package:notes/widgets/app_bar_widget.dart';
import 'package:notes/widgets/bottom_nav_bar_widget.dart';

import 'add_new_note_screen.dart';
import 'noteModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> noteList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        elevation: 1,
        backgroundColor: Colors.red.shade400,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNewNote(
                      onAddTap: (Note note) {
                        addNote(note);
                      },
                    )),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  itemCount: noteList.length,
                  itemBuilder: (context, index) {
                    final Note note = noteList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateNote(
                                    note: note,
                                    onNoteUpdate: (
                                      String updateNoteText,
                                      String updateDescriptionText,
                                    ) {
                                      updateNote(index, updateNoteText,
                                          updateDescriptionText);
                                    })));
                      },
                      child: Card(
                        color: note.bgColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  note.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(note.description),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const BottomNavBarWidget(),
          ],
        ),
      ),
    );
  }

  void addNote(Note note) {
    noteList.add(note);
    setState(() {});
  }

  void updateNote(int index, String noteTitle, noteDescription) {
    noteList[index].title = noteTitle;
    noteList[index].title = noteDescription;
    setState(() {});
  }

  void deleteNote(int index) {
    noteList.removeAt(index);
    setState(() {});
  }
}
