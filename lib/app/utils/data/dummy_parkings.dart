import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';

const DUMMY_PARKINGS = {
  '1': const ParkingModel(
    id: '1',
    parkingName: 'Estacionamento 1',
    valuePerHourSmallVeicles: '10.0',
    valuePerHourMediumVeicles: '20.0',
    valuePerHourBigVeicles: '30.0',
    parkingLots: '5',
  ),
  '2': const ParkingModel(
    id: '2',
    parkingName: 'Estacionamento 2',
    valuePerHourSmallVeicles: '5.0',
    valuePerHourMediumVeicles: '10.0',
    valuePerHourBigVeicles: '15.0',
    parkingLots: '20',
  ),
};
