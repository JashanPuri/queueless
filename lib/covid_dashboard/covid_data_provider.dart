import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CovidData {
  String stateName;
  final totalActive;
  final totalConfirmed;
  final totalDeaths;
  final totalRecovered;
  final deltaConfirmed;
  final deltaDeaths;
  final deltaRecovered;
  CovidData(
      {this.stateName,
      this.deltaConfirmed,
      this.deltaDeaths,
      this.deltaRecovered,
      this.totalActive,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered});
}

class CovidDataProvider with ChangeNotifier {
  CovidData _overallData;
  List<CovidData> _stateWiseData = [];
  String _lastUpdated;

  String get lastUpdated {
    return _lastUpdated;
  }

  CovidData get overallData {
    return _overallData;
  }

  List<CovidData> get stateWiseData {
    return [..._stateWiseData];
  }

  Future<void> getData() async {
    var url = Uri.parse(
        "https://corona-virus-world-and-india-data.p.rapidapi.com/api_india");

    const headers = {
      'x-rapidapi-key': "e1e455cd49mshd0fc70f7025559bp10674ajsnfca72e09a027",
      'x-rapidapi-host': "corona-virus-world-and-india-data.p.rapidapi.com"
    };
    try {
      final response = await http.get(url, headers: headers);
      final data = jsonDecode(response.body);
      //print(data.runtimeType);
      final _totalData = data["total_values"];
      final _stateData = data["state_wise"];
      _lastUpdated = data["lastupdatedtime"];
      //print(_stateData);
      _overallData = CovidData(
          totalActive: _totalData["active"],
          totalConfirmed: _totalData["confirmed"],
          totalDeaths: _totalData["deaths"],
          totalRecovered: _totalData["recovered"],
          deltaConfirmed: _totalData["deltaconfirmed"],
          deltaDeaths: _totalData["deltadeaths"],
          deltaRecovered: _totalData["deltarecovered"]);
      print("fuck -1");
      List<CovidData> _tempStateWiseData = [];
      _stateData.forEach((state, val) => _tempStateWiseData.add(CovidData(
          stateName: state,
          totalActive: val["active"],
          totalConfirmed: val["confirmed"],
          totalDeaths: val["deaths"],
          totalRecovered: val["recovered"],
          deltaConfirmed: val["deltaconfirmed"],
          deltaDeaths: val["deltadeaths"],
          deltaRecovered: val["deltarecovered"])));
      _stateWiseData = _tempStateWiseData;
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
