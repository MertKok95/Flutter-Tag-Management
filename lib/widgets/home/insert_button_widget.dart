import 'package:crud_tag_elements/models/tag_model.dart';
import 'package:flutter/material.dart';

class InsertButton extends StatelessWidget {
  final List<TagModel> tagModelList;
  final VoidCallback onPressed;

  const InsertButton(
      {super.key, required this.tagModelList, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('Ekle'));
  }
}
