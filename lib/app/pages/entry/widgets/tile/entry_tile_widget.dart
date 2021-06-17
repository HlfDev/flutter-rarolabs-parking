import 'package:flutter/material.dart';
import 'package:raro_parking_challenge/app/core/app_routes.dart';
import 'package:raro_parking_challenge/app/models/parking_model.dart';

class EntryTileWidget extends StatelessWidget {
  final ParkingLotModel parkingModel;

  const EntryTileWidget({Key? key, required this.parkingModel})
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
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.forward_sharp, color: Colors.orange, size: 32),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.ENTRY_DETAIL,
                      arguments: parkingModel);
                },
              )),
        )),
      ],
    );
  }
}
