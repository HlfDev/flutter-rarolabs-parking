import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:raro_parking_challenge/app/controller/parking_history_controller.dart';
import 'package:raro_parking_challenge/app/pages/departure/widgets/tile/departure_tile_widget.dart';

class DeparturePage extends StatelessWidget {
  const DeparturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ParkingHistoryController>(
          builder: (_, parkingController, __) {
        final _parkingList = parkingController.items.reversed;
        return ListView.builder(
          itemCount: _parkingList.length,
          itemBuilder: (BuildContext context, index) => DepartureTileWidget(
            parkingModel: _parkingList.elementAt(index),
          ),
        );
      }),
    );
  }
}
