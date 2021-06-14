import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/core/app_routes.dart';
import 'package:raro_parking_challenge/app/pages/parking/widgets/others/empty_parking_page.dart';
import 'package:raro_parking_challenge/app/pages/parking/widgets/tile/parking_tile.dart';
import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';
import 'package:raro_parking_challenge/app/shared/provider/parking_provider.dart';

class ParkingPage extends StatelessWidget {
  const ParkingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ParkingProvider parkingList = Provider.of(
      context,
      listen: true,
    );

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/parking_logo.png',
                width: 250,
                height: 250,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.PARKING_FORM,
                      arguments: ParkingModel(
                          id: '',
                          parkingLots: '',
                          parkingName: '',
                          valuePerHourBigVeicles: '',
                          valuePerHourMediumVeicles: '',
                          valuePerHourSmallVeicles: ''),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      textStyle: TextStyle(fontSize: 20)),
                  child: Text(
                    'Novo Estacionamento',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.garage, size: 32),
            SizedBox(
              width: 15,
            ),
            Text(
              'Meus Estacionamentos',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Icon(Icons.arrow_drop_down, size: 32),
          ],
        ),
        parkingList.count != 0
            ? Expanded(
                child: ListView.builder(
                  itemCount: parkingList.count,
                  itemBuilder: (BuildContext context, index) =>
                      ParkingTileWidget(
                    parkingModel: parkingList.byIndex(index),
                  ),
                ),
              )
            : Expanded(child: EmptyParking())
      ],
    );
  }
}
