import 'dart:math';

import 'package:flutter/material.dart';

import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';
import 'package:raro_parking_challenge/app/utils/data/dummy_parkings.dart';

class ParkingProvider with ChangeNotifier {
  Map<String, ParkingModel> _items = {...DUMMY_PARKINGS};

  List<ParkingModel> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  ParkingModel byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(ParkingModel parkingModel) {
    if (parkingModel.id.trim().isNotEmpty &&
        _items.containsKey(parkingModel.id)) {
      _items.update(parkingModel.id, (value) => parkingModel);
    } else {
      final id = Random().nextDouble().toString();
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

  void remove(ParkingModel parkingModel) {
    _items.remove(parkingModel.id);
    notifyListeners();
  }
}
