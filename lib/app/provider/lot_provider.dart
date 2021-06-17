import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raro_parking_challenge/app/data/dummy_lots.dart';
import 'package:raro_parking_challenge/app/models/lot_model.dart';

class LotProvider with ChangeNotifier {
  static const _baseUrl =
      "https://flutter-parking-challenge-default-rtdb.firebaseio.com/";

  Map<String, LotModel> _items = {...DUMMY_LOTS};

  List<LotModel> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  LotModel byIndex(int index) {
    return _items.values.elementAt(index);
  }

  Future<void> put(LotModel lotModel) async {
    if (lotModel.id.trim().isNotEmpty && _items.containsKey(lotModel.id)) {
      await http.patch(
        Uri.parse("$_baseUrl/lots/${lotModel.id}.json"),
        body: json.encode({
          "lotCode": lotModel.lotCode,
          "emptySpace": lotModel.emptySpace,
        }),
      );

      _items.update(lotModel.id, (value) => lotModel);
    } else {
      final response = await http.post(
        Uri.parse("$_baseUrl/lots.json"),
        body: json.encode({
          "lotCode": lotModel.lotCode,
          "emptySpace": lotModel.emptySpace,
        }),
      );

      final id = json.decode(response.body)['name'];

      _items.putIfAbsent(
          id,
          () => LotModel(
                id: id,
                lotCode: lotModel.lotCode,
                emptySpace: lotModel.emptySpace,
              ));
    }

    notifyListeners();
  }

  void remove(LotModel lot) async {
    await http.delete(
      Uri.parse("$_baseUrl/lots/${lot.id}.json"),
    );
    _items.remove(lot.id);
    notifyListeners();
  }
}
