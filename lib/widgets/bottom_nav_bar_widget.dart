import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            onPressed: () {},
            icon: const Icon(Icons.image_outlined),
          ),
        ],
      ),
    );
  }
}
