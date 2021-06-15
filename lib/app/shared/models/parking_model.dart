import 'dart:convert';

class ParkingModel {
  final String id;
  final String parkingName;
  final String valuePerHourSmallVeicles;
  final String valuePerHourMediumVeicles;
  final String valuePerHourBigVeicles;
  final String parkingLots;

  const ParkingModel({
    required this.id,
    required this.parkingName,
    required this.valuePerHourSmallVeicles,
    required this.valuePerHourMediumVeicles,
    required this.valuePerHourBigVeicles,
    required this.parkingLots,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parkingName': parkingName,
      'valuePerHourSmallVeicles': valuePerHourSmallVeicles,
      'valuePerHourMediumVeicles': valuePerHourMediumVeicles,
      'valuePerHourBigVeicles': valuePerHourBigVeicles,
      'parkingLots': parkingLots,
    };
  }

  factory ParkingModel.fromMap(Map<String, dynamic> map) {
    return ParkingModel(
      id: map['id'],
      parkingName: map['parkingName'],
      valuePerHourSmallVeicles: map['valuePerHourSmallVeicles'],
      valuePerHourMediumVeicles: map['valuePerHourMediumVeicles'],
      valuePerHourBigVeicles: map['valuePerHourBigVeicles'],
      parkingLots: map['parkingLots'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParkingModel.fromJson(String source) =>
      ParkingModel.fromMap(json.decode(source));
}
