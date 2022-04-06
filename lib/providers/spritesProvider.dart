import 'package:afriblox/gui/model/sprite.dart';
import 'package:flutter/material.dart';

import '../gui/assistants/loadJsonData.dart';

class SpritesProvider with ChangeNotifier {
  String _spritesTag = "All";
  String _selectedSprite = "";
  bool _isSearch = false;
  String _searchValue = "";

  String get spritesTag => _spritesTag;
  String get selectedSprite => _selectedSprite;
  bool get isSearch => _isSearch;
  String get searchValue => _searchValue;

  changeSpriteTag(String tag) {
    _spritesTag = tag;

    notifyListeners();
  }

  enableSearch(bool isEnabled, String value) {
    _isSearch = isEnabled;
    _searchValue = value;

    notifyListeners();
  }

  Future<List<Sprite>> getSprites(context) async {
    final spritesDataList = await LoadJsonData().getJsonData(
        context: context,
        library: "assets/libraries/sprites.json"
    );

    List<Sprite> sprites = [];

    spritesDataList.forEach((data) {
      Sprite sprite = Sprite.fromJson(data);

      sprites.add(sprite);
    });

    if(isSearch)
      {
        return sprites.where((sprite) => sprite.name!.toLowerCase() == _searchValue.toLowerCase()).toList();
      }
    else
      {
        if(_spritesTag != "All")
          {
            return sprites.where((sprite) => sprite.tags!.contains(_spritesTag.toLowerCase())).toList();
          }
        else
          {
            return sprites;
          }
      }
  }
}