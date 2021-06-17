import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raro_parking_challenge/app/models/lot_model.dart';

class LotProvider with ChangeNotifier {
  static const _baseUrl =
      "https://flutter-parking-challenge-default-rtdb.firebaseio.com/";

  List<LotModel> _items = [];

  Future<void> fetch() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/lots.json"),
    );

    var verifyNullResponse = jsonDecode(response.body);
    if (verifyNullResponse == null) {
      return;
    }
    
    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((id, data) {
      _items.add(LotModel(
        id: id,
        emptySpace: data['emptySpace'],
        lotCode: data['lotCode'], 

      ));
    });
    notifyListeners();
    return Future.value();
  }

  List<LotModel> get items {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  LotModel byIndex(int index) {
    return _items.elementAt(index);
  }

  Future<void> put(LotModel lotModel) async {
    if (lotModel.id.trim().isNotEmpty) {
      final index = _items.indexWhere((lot) => lot.id == lotModel.id);
      if (index >= 0) {
        await http.patch(
          Uri.parse("$_baseUrl/lots/${lotModel.id}.json"),
          body: json.encode({
            "lotCode": lotModel.lotCode,
            "emptySpace": lotModel.emptySpace,
          }),
        );

        _items[index] = lotModel;
      }
    } else {
      final response = await http.post(
        Uri.parse("$_baseUrl/lots.json"),
        body: json.encode({
          "lotCode": lotModel.lotCode,
          "emptySpace": lotModel.emptySpace,
        }),
      );

      _items.add(LotModel(
        id: json.decode(response.body)['name'],
        lotCode: lotModel.lotCode, emptySpace: lotModel.emptySpace,
      ));
    }

    notifyListeners();
  }

  void remove(String id) async {
    final index = _items.indexWhere((lot) => lot.id == id);

    if (index >= 0) {
      final lot = _items[index];
      _items.remove(lot);

      await http.delete(
        Uri.parse("$_baseUrl/lots/${lot.id}.json"),
      );
    }

    notifyListeners();
  }
}
