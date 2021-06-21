import 'package:flutter/material.dart';

import 'package:raro_parking_challenge/app/models/parking_model.dart';

class EntryDetailFormWidget extends StatefulWidget {
  const EntryDetailFormWidget({Key? key}) : super(key: key);

  @override
  _EntryDetailFormWidgetState createState() => _EntryDetailFormWidgetState();
}

class _EntryDetailFormWidgetState extends State<EntryDetailFormWidget> {
  @override
  Widget build(BuildContext context) {
    final parkingModel =
        ModalRoute.of(context)!.settings.arguments as ParkingModel;

    return Card(
      color: Colors.grey[300],
      shadowColor: Colors.grey,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    initialValue: parkingModel.model,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.local_shipping),
                      labelText: 'Modelo/Descrição',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    initialValue: parkingModel.lotCode,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.tag),
                      labelText: 'Código da Vaga',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    initialValue: parkingModel.plate,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.subtitles),
                      labelText: 'Placa',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
