import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.menu),
                hintText: "Search your notes",
                suffixIcon: CircleAvatar(
                  backgroundColor: Colors.red.shade400,
                  child: const Text(
                    'H',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
