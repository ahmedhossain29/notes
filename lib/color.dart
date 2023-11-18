import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorSelectionScreen(),
    );
  }
}

class ColorSelectionScreen extends StatefulWidget {
  @override
  _ColorSelectionScreenState createState() => _ColorSelectionScreenState();
}

class _ColorSelectionScreenState extends State<ColorSelectionScreen> {
  Color selectedColor = Colors.blue; // Default selected color

  final List<Color> colorList = [
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
      appBar: AppBar(
        title: Text('Color Selection Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: colorList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Color ${index + 1}'),
                  tileColor: colorList[index],
                  onTap: () {
                    _onColorSelected(colorList[index]);
                  },
                  trailing: selectedColor == colorList[index]
                      ? Icon(Icons.done)
                      : null,
                );
              },
            ),
          ),
          Container(
            height: 50.0,
            color: selectedColor,
            alignment: Alignment.center,
            child: Text(
              'Selected Color',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onColorSelected(Color color) {
    setState(() {
      selectedColor = color;
    });
  }
}
