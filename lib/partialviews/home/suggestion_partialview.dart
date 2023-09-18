import 'package:crud_tag_elements/models/tag_model.dart';
import 'package:crud_tag_elements/service/tag_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/home/tag_element.dart';

class SuggestionPartialView extends StatefulWidget {
  final List<TagModel> tagModelList;
  final List<TagModel> suggestionTagList;

  const SuggestionPartialView(
      {super.key, required this.tagModelList, required this.suggestionTagList});

  @override
  State<SuggestionPartialView> createState() => _SuggestionPartialViewState();
}

class _SuggestionPartialViewState extends State<SuggestionPartialView> {
  @override
  Widget build(BuildContext context) {
    if (widget.suggestionTagList.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Suggestions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
              alignment: WrapAlignment.start,
              children: widget.suggestionTagList.isNotEmpty
                  ? widget.suggestionTagList
                      .map((tagModel) => TagElement(
                            tagModel: tagModel,
                            onTap: () {
                              final tagService = context.read<TagService>();
                              tagService.AddTagElement(
                                  widget.tagModelList, tagModel.title);
                            },
                            action: 'Add',
                          ))
                      .toList()
                  : List.empty()),
        ],
      );
    } else {
      // return const Center(child: Text('Empty'));
      return Container();
    }
  }
}
