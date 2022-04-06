import 'package:afriblox/gui/model/sprite.dart';
import 'package:flutter/material.dart';

import '../gui/assistants/loadJsonData.dart';

class SpritesProvider with ChangeNotifier {
  String _spritesTag = "All";
  List<Sprite> _selectedSprites = [
    Sprite(
        name: "Maasai",
        tags: [
          "people"
        ],
        isStage: false,
        variables: {},
        costumes: [
          {
            "assetId": "bcf454acf82e4504149f7ffe07081dbc",
            "name": "maasai-a",
            "bitmapResolution": 1,
            "md5ext": "bcf454acf82e4504149f7ffe07081dbc.svg",
            "dataFormat": "svg",
            "rotationCenterX": -75,
            "rotationCenterY": 170
          },
          {
            "assetId": "0fb9be3e8397c983338cb71dc84d0b25",
            "name": "maasai-b",
            "bitmapResolution": 1,
            "md5ext": "0fb9be3e8397c983338cb71dc84d0b25.svg",
            "dataFormat": "svg",
            "rotationCenterX": -75,
            "rotationCenterY": 170
          }
        ],
        sounds: [
          {
            "assetId": "83c36d806dc92327b9e7049a565c6bff",
            "name": "Meow",
            "dataFormat": "wav",
            "format": "",
            "rate": 44100,
            "sampleCount": 37376,
            "md5ext": "83c36d806dc92327b9e7049a565c6bff.wav"
          }
        ],
        blocks: {}
    )
  ];
  bool _isSearch = false;
  String _searchValue = "";

  String get spritesTag => _spritesTag;
  List<Sprite> get selectedSprites => _selectedSprites;
  bool get isSearch => _isSearch;
  String get searchValue => _searchValue;

  changeSpriteTag(String tag) {
    _spritesTag = tag;

    notifyListeners();
  }

  addToSelectedSprites(Sprite sprite) {
    _selectedSprites.add(sprite);

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