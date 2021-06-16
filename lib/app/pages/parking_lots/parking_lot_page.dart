import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/pages/home/widgets/form/form_homepage2_widget.dart';
import 'package:raro_parking_challenge/app/pages/home/widgets/form/form_homepage_widget.dart';

import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';
import 'package:raro_parking_challenge/app/shared/provider/parking_provider.dart';

class ParkingLotPage extends StatelessWidget {
  const ParkingLotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parkingModel =
        ModalRoute.of(context)!.settings.arguments as ParkingLotModel;
    return Scaffold(
        appBar: AppBar(
          title: Text('${parkingModel.model}'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  FormHomePage2Widget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<ParkingProvider>(context, listen: false)
                            .remove(parkingModel);
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: TextStyle(fontSize: 20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete, color: Colors.white),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            'Excluir Entrada',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<ParkingProvider>(context, listen: false)
                            .remove(parkingModel);
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: TextStyle(fontSize: 20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete, color: Colors.white),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            'Realizar Saida',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
