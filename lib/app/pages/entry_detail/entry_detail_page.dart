import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/models/parking_model.dart';
import 'package:raro_parking_challenge/app/pages/entry_detail/widgets/form/entry_detail_form_widget.dart';
import 'package:raro_parking_challenge/app/provider/parking_provider.dart';

class EntryDetailPage extends StatelessWidget {
  const EntryDetailPage({Key? key}) : super(key: key);

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
                  EntryDetailFormWidget(),
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
