import 'package:crud_tag_elements/partialviews/home/suggestion_partialview.dart';
import 'package:crud_tag_elements/widgets/home/input_widget.dart';
import 'package:crud_tag_elements/widgets/home/insert_button_widget.dart';
import 'package:crud_tag_elements/widgets/home/tag_element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/tag_suggestions.dart';
import 'service/tag_service.dart';
import 'widgets/home/clear_filter_button.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TagService tagService;
  // input değerini dinlememiz için gerekli değişken
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  String get _searchText => _searchTextEditingController.text.trim();

  @override
  void initState() {
    super.initState();
    tagService = context.read<TagService>();
    // _searchTextEditingController.addListener(() => refreshState());
  }

  refreshState() {
    // tagService.FilterSearchResultList(tagService.tagModelList, _searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TagService>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tags',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
            value.tagModelList.isNotEmpty
                ? Column(children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: value.selectedTagModelList.isNotEmpty
                          ? value.selectedTagModelList
                              .map((tagModel) => TagElement(
                                    tagModel: tagModel,
                                    onTap: () {
                                      tagService.RemoveTagElement(
                                          value.selectedTagModelList, tagModel);
                                    },
                                    action: 'Remove',
                                  ))
                              .toSet()
                              .toList()
                          : value.tagModelList
                              .map((tagModel) => TagElement(
                                    tagModel: tagModel,
                                    onTap: () {
                                      tagService.RemoveTagElement(
                                          value.tagModelList, tagModel);
                                    },
                                    action: 'Remove',
                                  ))
                              .toSet()
                              .toList(),
                    ),
                  ])
                : Container(),
            InputWidget(
                inputController: _searchTextEditingController,
                value: _searchText),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InsertButton(
                  tagModelList: value.tagModelList,
                  onPressed: () {
                    tagService.RemoveSelectedTagList();
                    tagService.AddTagElement(
                        tagService.tagModelList, _searchText);
                    _searchTextEditingController.clear();
                  },
                ),
                ClearFilterButton(
                  tagModelList: value.tagModelList,
                  onPressed: () {
                    tagService.FilterSearchResultList(tagService.tagModelList,
                        _searchTextEditingController.text);
                    tagService.RemoveAllTagElement();
                    _searchTextEditingController.clear();
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SuggestionPartialView(
                tagModelList: value.tagModelList,
                suggestionTagList: TagSuggestions().tagsToSelect,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
