import 'package:afriblox/gui/model/costume.dart';
import 'package:flutter/material.dart';

import '../gui/assistants/loadJsonData.dart';

class CostumesProvider with ChangeNotifier {
  String _costumesTag = "All";
  String _selectedCostume = "";
  bool _isSearch = false;
  String _searchValue = "";

  String get costumesTag => _costumesTag;
  String get selectedCostume => _selectedCostume;
  bool get isSearch => _isSearch;
  String get searchValue => _searchValue;

  changeCostumeTag(String tag) {
    _costumesTag = tag;

    notifyListeners();
  }

  enableSearch(bool isEnabled, String value) {
    _isSearch = isEnabled;
    _searchValue = value;

    notifyListeners();
  }

  Future<List<Costume>> getCostumes(context) async {
    final costumesDataList = await LoadJsonData().getJsonData(
        context: context,
        library: "assets/libraries/costumes.json"
    );

    List<Costume> costumes = [];

    costumesDataList.forEach((data) {
      Costume costume = Costume.fromJson(data);

      costumes.add(costume);
    });

    if(isSearch)
    {
      return costumes.where((costume) => costume.name!.toLowerCase() == _searchValue.toLowerCase()).toList();
    }
    else
    {
      if(_costumesTag != "All")
      {
        return costumes.where((costume) => costume.tags!.contains(_costumesTag.toLowerCase())).toList();
      }
      else
      {
        return costumes;
      }
    }
  }
}