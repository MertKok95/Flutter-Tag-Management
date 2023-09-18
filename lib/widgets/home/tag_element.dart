import 'package:flutter/material.dart';

import '../../models/tag_model.dart';

class TagElement extends StatelessWidget {
  final TagModel tagModel;
  final GestureTapCallback? onTap;
  final String action;

  const TagElement(
      {super.key, required this.tagModel, this.onTap, required this.action});

  @override
  Widget build(BuildContext context) {
    return tagChip(tagModel: tagModel, onTap: onTap, action: action);
  }

  Widget tagChip({
    tagModel,
    onTap,
    action,
  }) {
    return InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Text(
                  '${tagModel.title}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.orange.shade600,
                radius: 8.0,
                child: action == "Add"
                    ? const Icon(
                        Icons.add,
                        size: 10.0,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.clear,
                        size: 10.0,
                        color: Colors.white,
                      ),
              ),
            )
          ],
        ));
  }
}
