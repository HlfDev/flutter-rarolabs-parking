import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';

class ParkingProvider with ChangeNotifier {
  static const _baseUrl =
      "https://flutter-parking-challenge-default-rtdb.firebaseio.com/";

  Map<String, ParkingModel> _items = {};

  List<ParkingModel> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Future<void> load() async {
    var response = await http.get(Uri.parse("$_baseUrl/parkings.json"));

    var json = await jsonDecode(response.body);
  }

  ParkingModel byIndex(int index) {
    return _items.values.elementAt(index);
  }

  Future<void> put(ParkingModel parkingModel) async {
    if (parkingModel.id.trim().isNotEmpty &&
        _items.containsKey(parkingModel.id)) {
      await http.patch(
        Uri.parse("$_baseUrl/parkings/${parkingModel.id}.json"),
        body: json.encode({
          "parkingLots": parkingModel.parkingLots,
          "parkingName": parkingModel.parkingName,
          "valuePerHourBigVeicles": parkingModel.valuePerHourBigVeicles,
          "valuePerHourMediumVeicles": parkingModel.valuePerHourMediumVeicles,
          "valuePerHourSmallVeicles": parkingModel.valuePerHourSmallVeicles,
        }),
      );

      _items.update(parkingModel.id, (value) => parkingModel);
    } else {
      final response = await http.post(
        Uri.parse("$_baseUrl/parkings.json"),
        body: json.encode({
          "parkingLots": parkingModel.parkingLots,
          "parkingName": parkingModel.parkingName,
          "valuePerHourBigVeicles": parkingModel.valuePerHourBigVeicles,
          "valuePerHourMediumVeicles": parkingModel.valuePerHourMediumVeicles,
          "valuePerHourSmallVeicles": parkingModel.valuePerHourSmallVeicles,
        }),
      );

      final id = json.decode(response.body)['name'];

      _items.putIfAbsent(
          id,
          () => ParkingModel(
                id: id,
                parkingLots: parkingModel.parkingLots,
                parkingName: parkingModel.parkingName,
                valuePerHourBigVeicles: parkingModel.valuePerHourBigVeicles,
                valuePerHourMediumVeicles:
                    parkingModel.valuePerHourMediumVeicles,
                valuePerHourSmallVeicles: parkingModel.valuePerHourSmallVeicles,
              ));
    }

    notifyListeners();
  }

  void remove(ParkingModel parkingModel) async {
    await http.delete(
      Uri.parse("$_baseUrl/parkings/${parkingModel.id}.json"),
    );
    _items.remove(parkingModel.id);
    notifyListeners();
  }
}
