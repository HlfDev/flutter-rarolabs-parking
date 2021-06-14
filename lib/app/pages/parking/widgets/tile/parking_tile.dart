import 'package:flutter/material.dart';
import 'package:raro_parking_challenge/app/core/app_routes.dart';
import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';

class ParkingTileWidget extends StatelessWidget {
  final ParkingModel parkingModel;

  const ParkingTileWidget({Key? key, required this.parkingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.grey[700],
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.local_parking,
                    )),
                title: Text(parkingModel.parkingName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vagas 0/${parkingModel.parkingLots}'),
                  ],
                ),
                trailing: Container(
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.PARKING_LOT,
                          arguments: parkingModel);
                    },
                    child: Text(
                      'Acessar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
