import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raro_parking_challenge/app/models/parking_model.dart';

class ParkingProvider with ChangeNotifier {
  static const _baseUrl =
      "https://flutter-parking-challenge-default-rtdb.firebaseio.com/";

  List<ParkingLotModel> _items = [];

  Future<void> fetch() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/parkings.json"),
    );

    var verifyNullResponse = jsonDecode(response.body);
    if (verifyNullResponse == null) {
      return;
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    if (data != null) {
      data.forEach((id, data) {
        _items.add(ParkingLotModel(
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
    return Future.value();
  }

  List<ParkingLotModel> get items {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  ParkingLotModel byIndex(int index) {
    return _items.elementAt(index);
  }

  Future<void> put(ParkingLotModel parkingModel) async {
    if (parkingModel.id.trim().isNotEmpty) {
      final index = _items.indexWhere((park) => park.id == parkingModel.id);
      if (index >= 0) {
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

        _items[index] = parkingModel;
      }
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

      _items.add(ParkingLotModel(
        id: json.decode(response.body)['name'],
        model: parkingModel.model,
        plate: parkingModel.plate,
        lotCode: parkingModel.lotCode,
        entryDate: parkingModel.entryDate,
        departureDate: parkingModel.departureDate,
      ));
    }

    notifyListeners();
  }

  void remove(String id) async {
    final index = _items.indexWhere((park) => park.id == id);

    if (index >= 0) {
      final parking = _items[index];
      _items.remove(parking);

      await http.delete(
        Uri.parse("$_baseUrl/parkings/${parking.id}.json"),
      );
    }

    notifyListeners();
  }
}
