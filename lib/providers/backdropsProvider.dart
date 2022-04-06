import 'package:flutter/material.dart';

import '../gui/assistants/loadJsonData.dart';
import '../gui/model/backdrop.dart';

class BackdropsProvider with ChangeNotifier {
  String _backdropTag = "All";
  String _selectedBackdrop = "";
  bool _isSearch = false;
  String _searchValue = "";

  String get backdropTag => _backdropTag;
  String get selectedBackdrop => _selectedBackdrop;
  bool get isSearch => _isSearch;
  String get searchValue => _searchValue;

  changeBackdropTag(String tag) {
    _backdropTag = tag;

    notifyListeners();
  }

  enableSearch(bool isEnabled, String value) {
    _isSearch = isEnabled;
    _searchValue = value;

    notifyListeners();
  }

  Future<List<Backdrop>> getBackdrops(context) async {
    final backdropDataList = await LoadJsonData().getJsonData(
        context: context,
        library: "assets/libraries/backdrops.json"
    );

    List<Backdrop> backdrops = [];
    backdropDataList.forEach((data) {
      Backdrop backdrop = Backdrop.fromJson(data);

      backdrops.add(backdrop);
    });

    if(isSearch)
    {
      return backdrops.where((backdrop) => backdrop.name!.toLowerCase().contains(searchValue.toLowerCase())).toList();
    }
    else
    {
      if(_backdropTag != "All")
        {
          return backdrops.where((backdrop) => backdrop.tags!.contains(_backdropTag.toLowerCase())).toList();
        }
      else
        {
          return backdrops;
        }
    }

  }

}
