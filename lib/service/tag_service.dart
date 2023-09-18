import 'package:flutter/material.dart';
import '../models/tag_model.dart';

class TagService extends ChangeNotifier {
  final List<TagModel> tagModelList = [];
  List<TagModel> selectedTagModelList = [];

  // ignore: non_constant_identifier_names
  List<TagModel> AddTagElement(List<TagModel> tagModelList, String value) {
    if (value.isNotEmpty &&
        !tagModelList.any((element) => element.title == value)) {
      int id = 1;
      if (tagModelList.isNotEmpty) {
        var lastElementId = tagModelList[tagModelList.length - 1].id;
        id = (int.parse(lastElementId) + 1);
      }

      tagModelList.add(TagModel(id: id.toString(), title: value));
      notifyListeners();
    }
    return tagModelList;
  }

  // ignore: non_constant_identifier_names
  List<TagModel> RemoveTagElement(
      List<TagModel> tagModelList, TagModel tagModel) {
    if (tagModelList.any((element) => element.id == tagModel.id)) {
      tagModelList.remove(tagModel);
      notifyListeners();
    }
    return tagModelList;
  }

  // ignore: non_constant_identifier_names
  RemoveAllTagElement() {
    tagModelList.clear();
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  RemoveSelectedTagList() {
    selectedTagModelList.clear();
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  FilterSearchResultList(List<TagModel> tagModelList, String value) {
    List<TagModel> _tempList = [];
    for (int index = 0; index < tagModelList.length; index++) {
      TagModel tagModel = tagModelList[index];
      if (tagModel.title.toLowerCase().trim().contains(value.toLowerCase())) {
        _tempList.add(tagModel);
      }
    }
    selectedTagModelList = _tempList;
    notifyListeners();
  }
}
