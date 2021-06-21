import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raro_parking_challenge/app/models/lot_model.dart';

class LotController with ChangeNotifier {
  static const _baseUrl =
      "https://flutter-parking-challenge-default-rtdb.firebaseio.com/";

  static String _emptySpace = 'emptySpace';
  static String _lotCode = 'lotCode';

  List<LotModel> _items = [];

  List<bool> _toggleLotSelected = [true, false];

  bool _showAvailableLots = true;

  List<bool> get toggleLotSelected => _toggleLotSelected;

  set isSelected(List<bool> value) {
    _toggleLotSelected = value;
  }

  bool get showAvailableLots => _showAvailableLots;
  set showAvailableLots(bool value) {
    _showAvailableLots = value;
    notifyListeners();
  }

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
        emptySpace: data[_emptySpace],
        lotCode: data[_lotCode],
      ));
    });

    notifyListeners();

    return Future.value();
  }

  List<LotModel> get items {
    if (showAvailableLots == true) {
      return [..._items].where((e) => e.emptySpace == true).toList();
    } else {
      return [..._items].where((e) => e.emptySpace == false).toList();
    }
  }

  Future<void> put(LotModel lotModel) async {
    if (lotModel.id.trim().isNotEmpty) {
      final index = _items.indexWhere((lot) => lot.id == lotModel.id);
      if (index >= 0) {
        await http.patch(
          Uri.parse("$_baseUrl/lots/${lotModel.id}.json"),
          body: json.encode({
            _lotCode: lotModel.lotCode,
            _emptySpace: lotModel.emptySpace,
          }),
        );

        _items[index] = lotModel;
      }
    } else {
      final response = await http.post(
        Uri.parse("$_baseUrl/lots.json"),
        body: json.encode({
          _lotCode: lotModel.lotCode,
          _emptySpace: lotModel.emptySpace,
        }),
      );

      _items.add(LotModel(
        id: json.decode(response.body)['name'],
        lotCode: lotModel.lotCode,
        emptySpace: lotModel.emptySpace,
      ));
    }

    notifyListeners();
  }

  void updateStatus(String lotCode, bool status) async {
    final index = _items.indexWhere((lot) => lot.lotCode == lotCode);

    final LotModel lotModel = _items[index];

    await http.patch(
      Uri.parse("$_baseUrl/lots/${lotModel.id}.json"),
      body: json.encode({
        _lotCode: lotModel.lotCode,
        _emptySpace: status,
      }),
    );

    _items[index] = LotModel(
      id: lotModel.id,
      emptySpace: status,
      lotCode: lotModel.lotCode,
    );

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
