import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/models/lot_model.dart';
import 'package:raro_parking_challenge/app/provider/lot_provider.dart';

class LotTileWidget extends StatelessWidget {
  final LotModel lotModel;

  const LotTileWidget({Key? key, required this.lotModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emUso = !lotModel.emptySpace ? 'Em uso' : 'Disponivel';
    return Row(
      children: [
        Expanded(
            child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: !lotModel.emptySpace ? Colors.grey[800] : Colors.green,
          child: ListTile(
            title: Text(
              '[${lotModel.lotCode}] $emUso',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            trailing: lotModel.emptySpace
                ? TextButton.icon(
                    onPressed: () {
                      Provider.of<LotProvider>(context, listen: false)
                          .remove(lotModel);
                    },
                    icon: Icon(Icons.delete, color: Colors.white),
                    label: Text(
                      'Remover Vaga',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Text(''),
          ),
        )),
      ],
    );
  }
}
