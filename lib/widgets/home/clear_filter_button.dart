import 'package:crud_tag_elements/models/tag_model.dart';
import 'package:flutter/material.dart';

class ClearFilterButton extends StatelessWidget {
  final List<TagModel> tagModelList;
  final VoidCallback onPressed;

  const ClearFilterButton(
      {super.key, required this.tagModelList, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed, child: const Text('Arama Filtresini Temizle'));
  }
}
