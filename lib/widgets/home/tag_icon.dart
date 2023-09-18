import 'package:flutter/material.dart';

class TagIcon extends StatelessWidget {
  const TagIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.local_offer_outlined,
          color: Colors.deepOrangeAccent,
          size: 25.0,
        ),
      ],
    );
  }
}
