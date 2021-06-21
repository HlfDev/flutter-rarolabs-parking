import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/controller/lot_controller.dart';
import 'package:raro_parking_challenge/app/controller/parking_controller.dart';
import 'package:raro_parking_challenge/app/controller/parking_history_controller.dart';
import 'package:raro_parking_challenge/app/models/parking_model.dart';
import 'package:raro_parking_challenge/app/pages/entry_detail/widgets/form/entry_detail_form_widget.dart';

class EntryDetailPage extends StatelessWidget {
  const EntryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parkingModel =
        ModalRoute.of(context)!.settings.arguments as ParkingModel;

    String dateFormate = DateFormat("yyyy/MM/dd hh:mm")
        .format(DateTime.parse(parkingModel.entryDate));
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '[${parkingModel.lotCode}] ${parkingModel.model} - ${parkingModel.plate}'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: 16),
                    Card(
                      color: Colors.grey[300],
                      shadowColor: Colors.grey,
                      elevation: 2,
                      child: Container(
                        margin: EdgeInsets.all(20.0),
                        child: Text('Entrada: $dateFormate',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    SizedBox(height: 16),
                    EntryDetailFormWidget(),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Provider.of<ParkingHistoryController>(context,
                                        listen: false)
                                    .put(ParkingModel(
                                  id: parkingModel.id,
                                  departureDate: '${DateTime.now()}',
                                  entryDate: parkingModel.entryDate,
                                  lotCode: parkingModel.lotCode,
                                  model: parkingModel.model,
                                  plate: parkingModel.plate,
                                ));

                                Provider.of<LotController>(context,
                                        listen: false)
                                    .updateStatus(parkingModel.lotCode, true);

                                Provider.of<ParkingController>(context,
                                        listen: false)
                                    .remove(parkingModel.id);

                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              label: Text(
                                'Efetuar Saída',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              icon: Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Provider.of<ParkingController>(context,
                                        listen: false)
                                    .remove(parkingModel.id);

                                Provider.of<LotController>(context,
                                        listen: false)
                                    .updateStatus(parkingModel.lotCode, true);

                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              label: Text(
                                'Excluir Entrada',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
