import 'package:flutter/material.dart';

class ColorAndBackgroundPicker extends StatelessWidget {
  const ColorAndBackgroundPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Color',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
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
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
