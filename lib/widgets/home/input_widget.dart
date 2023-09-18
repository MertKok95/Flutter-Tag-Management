import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/tag_service.dart';

// ignore: must_be_immutable
class InputWidget extends StatefulWidget {
  final TextEditingController inputController;
  String? value;

  InputWidget({super.key, required this.inputController, this.value});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  // ignore: non_constant_identifier_names
  IconButton GetInputSuffixIcon() {
    return IconButton(
      icon: Icon(Icons.search, color: Colors.grey.shade700),
      onPressed: () {
        var value = widget.inputController.text;
        if (value.isNotEmpty) {
          var tagService = context.read<TagService>();
          tagService.FilterSearchResultList(
              tagService.tagModelList, widget.inputController.text);
          widget.inputController.clear();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
        bottom: 5.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        border: Border.all(
          color: Colors.grey.shade500,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.inputController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Search Tag',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              style: const TextStyle(
                fontSize: 16.0,
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          GetInputSuffixIcon(),
        ],
      ),
    );
  }
}
