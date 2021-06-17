import 'dart:convert';

class ParkingLotModel {

  static String _id = 'id';
  static String _model = 'model';
  static String _plate = 'plate';
  static String _lotCode = 'lotCode';
  static String _entryDate = 'entryDate';
  static String _departureDate = 'departureDate';


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
      _id : id,
      _model: model,
      _plate: plate,
      _lotCode: lotCode,
      _entryDate: entryDate,
      _departureDate: departureDate,
    };
  }

  factory ParkingLotModel.fromMap(Map<String, dynamic> map) {
    return ParkingLotModel(
      id: map[_id],
      model: map[_model],
      plate: map[_plate],
      lotCode: map[_lotCode],
      entryDate: map[_entryDate],
      departureDate: map[_departureDate],
    );
  }


  String toJson() => json.encode(toMap());

  factory ParkingLotModel.fromJson(String source) =>
      ParkingLotModel.fromMap(json.decode(source));
}
