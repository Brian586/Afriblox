import 'package:flutter/material.dart';

import '../gui/assistants/loadJsonData.dart';
import '../gui/model/backdrop.dart';

class BackdropsProvider with ChangeNotifier {
  String _backdropTag = "All";
  bool _showBackdropPaintTab = false;
  List<Backdrop> _selectedBackdrops = [
    Backdrop(
        name: "Arctic",
        md5: "67e0db3305b3c8bac3a363b1c428892e.png",
        type: "backdrop",
        tags: [
        "outdoors",
        "cold",
        "north pole",
        "south pole",
        "ice",
        "antarctica",
        "robert hunter"
        ],
        info: [
        960,
        720,
        2
        ]
    ),
  ];
  bool _isSearch = false;
  String _searchValue = "";

  String get backdropTag => _backdropTag;
  List<Backdrop> get selectedBackdrops => _selectedBackdrops;
  bool get isSearch => _isSearch;
  String get searchValue => _searchValue;
  bool get showBackdropPaintTab => _showBackdropPaintTab;

  changeBackdropTag(String tag) {
    _backdropTag = tag;

    notifyListeners();
  }

  switchToBackdropPaintTab(bool value) {
    _showBackdropPaintTab = value;

    notifyListeners();
  }

  addToSelectedBackdrops(Backdrop backdrop) {
    _selectedBackdrops.add(backdrop);

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
