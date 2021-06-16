import 'package:flutter/material.dart';
import 'package:raro_parking_challenge/app/core/app_routes.dart';
import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';

class ParkingTileWidget extends StatelessWidget {
  final ParkingLotModel parkingModel;

  const ParkingTileWidget({Key? key, required this.parkingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.grey[800],
          child: ListTile(
            title: Text(
              '[${parkingModel.lotCode}] ${parkingModel.plate} - ${parkingModel.model}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange,
              ),
            ),
            trailing: TextButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.PARKING_LOT, arguments: parkingModel);
              },
              icon: Icon(Icons.input),
              label: Text(
                'ACESSAR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
