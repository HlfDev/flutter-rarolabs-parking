import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:raro_parking_challenge/app/models/parking_model.dart';
import 'package:http/http.dart' as http;

class ParkingHistoryController with ChangeNotifier {
  static const _baseUrl =
      "https://flutter-parking-challenge-default-rtdb.firebaseio.com/";

  static String _model = 'model';
  static String _plate = 'plate';
  static String _entryDate = 'entryDate';
  static String _departureDate = 'departureDate';
  static String _lotCode = 'lotCode';

  List<ParkingModel> _items = [];

  Future<void> fetch() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/parkings_history.json"),
    );

    var verifyNullResponse = jsonDecode(response.body);
    if (verifyNullResponse == null) {
      return;
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((id, data) {
      _items.add(ParkingModel(
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

  List<ParkingModel> get items {
    return [..._items];
  }

  Future<void> put(ParkingModel parkingModel) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/parkings_history.json"),
      body: json.encode({
        _model: parkingModel.model,
        _plate: parkingModel.plate,
        _lotCode: parkingModel.lotCode,
        _entryDate: parkingModel.entryDate,
        _departureDate: '${DateTime.now()}',
      }),
    );

    _items.add(ParkingModel(
      id: json.decode(response.body)['name'],
      model: parkingModel.model,
      plate: parkingModel.plate,
      lotCode: parkingModel.lotCode,
      entryDate: parkingModel.entryDate,
      departureDate: parkingModel.departureDate,
    ));
    notifyListeners();
  }
}
