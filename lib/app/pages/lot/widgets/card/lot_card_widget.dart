import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/controller/lot_controller.dart';
import 'package:raro_parking_challenge/app/pages/lot/widgets/toggle_lot/toggle_lot.dart';

class LotCardWidget extends StatelessWidget {
  const LotCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LotController>(builder: (_, lotController, __) {
      final lotList = lotController.items;
      return Card(
        color: Colors.grey[300],
        shadowColor: Colors.grey,
        elevation: 2,
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleLotWidget(),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Vagas: ${lotList.length}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
