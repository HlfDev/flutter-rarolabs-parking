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
}
