import 'package:afriblox/gui/model/sound.dart';
import 'package:flutter/material.dart';

import '../gui/assistants/loadJsonData.dart';

class SoundProvider with ChangeNotifier {
  String _soundsTag = "All";
  String _selectedSound = "";
  bool _isSearch = false;
  String _searchValue = "";

  String get soundsTag => _soundsTag;
  String get selectedSound => _selectedSound;
  bool get isSearch => _isSearch;
  String get searchValue => _searchValue;

  changeSoundTag(String tag) {
    _soundsTag = tag;

    notifyListeners();
  }

  enableSearch(bool isEnabled, String value) {
    _isSearch = isEnabled;
    _searchValue = value;

    notifyListeners();
  }

  Future<List<Sound>> getSounds(context) async {
    final soundsDataList = await LoadJsonData().getJsonData(
        context: context,
        library: "assets/libraries/sounds.json"
    );

    List<Sound> sounds = [];

    soundsDataList.forEach((data) {
      Sound sound = Sound.fromJson(data);

      sounds.add(sound);
    });

    if(isSearch)
    {
      return sounds.where((sound) => sound.name!.toLowerCase() == _searchValue.toLowerCase()).toList();
    }
    else
    {
      if(_soundsTag != "All")
      {
        return sounds.where((sound) => sound.tags!.contains(_soundsTag.toLowerCase())).toList();
      }
      else
      {
        return sounds;
      }
    }
  }

}