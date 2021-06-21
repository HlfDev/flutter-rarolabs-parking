import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_parking_challenge/app/models/parking_model.dart';

class DepartureTileWidget extends StatelessWidget {
  final ParkingModel parkingModel;

  const DepartureTileWidget({Key? key, required this.parkingModel})
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
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.garage, color: Colors.orange),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Veículo: ${parkingModel.model} - ${parkingModel.plate}',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 18.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Entrada: ${DateFormat("yyyy/MM/dd hh:mm").format(DateTime.parse(parkingModel.entryDate))}',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      Text(
                        'Saída: ${DateFormat("yyyy/MM/dd hh:mm").format(DateTime.parse(parkingModel.departureDate))}',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ))),
      ],
    );
  }
}
