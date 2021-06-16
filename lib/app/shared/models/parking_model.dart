import 'dart:convert';

class ParkingLotModel {
  final String id;
  final String model;
  final String plate;
  final String lotCode;
  final String entryDate;
  final String departureDate;

  const ParkingLotModel({
    required this.id,
    required this.model,
    required this.plate,
    required this.lotCode,
    required this.entryDate,
    required this.departureDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'model': model,
      'plate': plate,
      'lotCode': lotCode,
      'entryDate': entryDate,
      'departureDate': departureDate,
    };
  }

  factory ParkingLotModel.fromMap(Map<String, dynamic> map) {
    return ParkingLotModel(
      id: map['id'],
      model: map['model'],
      plate: map['plate'],
      lotCode: map['lotCode'],
      entryDate: map['entryDate'],
      departureDate: map['departureDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParkingLotModel.fromJson(String source) =>
      ParkingLotModel.fromMap(json.decode(source));
}
