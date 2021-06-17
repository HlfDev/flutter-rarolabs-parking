import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raro_parking_challenge/app/models/parking_model.dart';

class ParkingProvider with ChangeNotifier {
  static const _baseUrl =
      "https://flutter-parking-challenge-default-rtdb.firebaseio.com/";

  static String _model = 'model';
  static String _plate = 'model';
  static String _entryDate = 'entryDate';
  static String _departureDate = 'departureDate';
  static String _lotCode = '_lotCode';

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

    data.forEach((id, data) {
      _items.add(ParkingLotModel(
        id: id,
        departureDate: data[_departureDate],
        entryDate: data[_entryDate],
        lotCode: data[_lotCode],
        model: data[_model],
        plate: data[_plate],
      ));
    });
    notifyListeners();
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
          Uri.parse("$_baseUrl/parkings/${parkingModel.id}.json"),
          body: json.encode({
            _model: parkingModel.model,
            _plate: parkingModel.plate,
            _lotCode: parkingModel.lotCode,
            _entryDate: parkingModel.entryDate,
            _departureDate: parkingModel.entryDate,
          }),
        );

        _items[index] = parkingModel;
      }
    } else {
      final response = await http.post(
        Uri.parse("$_baseUrl/parkings.json"),
        body: json.encode({
          _model: parkingModel.model,
          _plate: parkingModel.plate,
          _lotCode: parkingModel.lotCode,
          _entryDate: parkingModel.entryDate,
          _departureDate: parkingModel.entryDate,
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
