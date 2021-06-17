import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raro_parking_challenge/app/models/parking_model.dart';

class ParkingProvider with ChangeNotifier {
  static const _baseUrl =
      "https://flutter-parking-challenge-default-rtdb.firebaseio.com/";

  Map<String, ParkingLotModel> _items = {};
  List<ParkingLotModel> _listItems = [];

  Future<void> fetch() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/parkings.json"),
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((id, data) {
      _listItems.add(ParkingLotModel(
        id: id,
        departureDate: data['departureDate'],
        entryDate: data['entryDate'],
        lotCode: data['lotCode'],
        model: data['model'],
        plate: data['plate'],
      ));
    });
    notifyListeners();
  }

  List<ParkingLotModel> get all {
    return [..._listItems];
  }

  int get count {
    return _items.length;
  }

  ParkingLotModel byIndex(int index) {
    return _items.values.elementAt(index);
  }

  Future<void> put(ParkingLotModel parkingModel) async {
    if (parkingModel.id.trim().isNotEmpty &&
        _items.containsKey(parkingModel.id)) {
      await http.patch(
        Uri.parse("$_baseUrl/parkingLots/${parkingModel.id}.json"),
        body: json.encode({
          "model": parkingModel.model,
          "plate": parkingModel.plate,
          "lotCode": parkingModel.lotCode,
          "entryDate": parkingModel.entryDate,
          "departureDate": parkingModel.entryDate,
        }),
      );

      _items.update(parkingModel.id, (value) => parkingModel);
    } else {
      final response = await http.post(
        Uri.parse("$_baseUrl/parkings.json"),
        body: json.encode({
          "model": parkingModel.model,
          "plate": parkingModel.plate,
          "lotCode": parkingModel.lotCode,
          "entryDate": parkingModel.entryDate,
          "departureDate": parkingModel.entryDate,
        }),
      );

      final id = json.decode(response.body)['name'];

      _items.putIfAbsent(
          id,
          () => ParkingLotModel(
                id: id,
                model: parkingModel.model,
                plate: parkingModel.plate,
                lotCode: parkingModel.lotCode,
                entryDate: parkingModel.entryDate,
                departureDate: parkingModel.departureDate,
              ));
    }

    notifyListeners();
  }

  void remove(ParkingLotModel parkingLot) async {
    await http.delete(
      Uri.parse("$_baseUrl/parkings/${parkingLot.id}.json"),
    );
    _items.remove(parkingLot.id);
    notifyListeners();
  }
}
