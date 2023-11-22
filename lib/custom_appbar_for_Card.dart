// import 'package:flutter/material.dart';
//
// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({super.key});
//
//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();
// }
//
// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.close),
//         title: const Text('1 selected'),
//         actions: const [
//           Icon(Icons.file_upload),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Icon(Icons.delete),
//           ),
//           Icon(Icons.more_vert),
//         ],
//         backgroundColor: Colors.black87,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showTopBottomSheet(context);
          },
          child: Text('Show Top Bottom Sheet'),
        ),
      ),
    );
  }

  void _showTopBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Top Bottom Sheet Content',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
