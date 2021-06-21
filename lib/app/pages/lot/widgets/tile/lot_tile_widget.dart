import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/controller/lot_controller.dart';
import 'package:raro_parking_challenge/app/core/core.dart';
import 'package:raro_parking_challenge/app/models/lot_model.dart';

class LotTileWidget extends StatelessWidget {
  const LotTileWidget({required this.lotModel});

  final LotModel lotModel;

  static String _textEmpty = '';
  static String _textInUse = 'Em uso';
  static String _textAvaible = 'Disponivel';
  static String _textRemove = 'Remover Vaga';

  @override
  Widget build(BuildContext context) {
    String _inUse = !lotModel.emptySpace ? _textInUse : _textAvaible;
    Icon _iconDeleted = Icon(Icons.delete, color: Colors.white);

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
              '[${lotModel.lotCode}] $_inUse',
              textAlign: TextAlign.start,
              style: AppTextStyles.text18White,
            ),
            trailing: lotModel.emptySpace
                ? TextButton.icon(
                    onPressed: () {
                      showAlertDialog(context, lotModel);
                    },
                    icon: _iconDeleted,
                    label: Text(
                      _textRemove,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.text18White,
                    ),
                  )
                : Text(_textEmpty),
          ),
        )),
      ],
    );
  }
}

showAlertDialog(BuildContext context, LotModel lotModel) {
  String _textYes = 'Sim';
  String _textNo = 'Não';
  String _textTitle = 'Remover Vaga';
  String _textContent = 'Deseja mesmo remover a Vaga: ${lotModel.lotCode}?';
  var _provider = Provider.of<LotController>(context, listen: false);

  Widget cancelButton = TextButton(
    child: Text(_textNo, style: AppTextStyles.text18),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(_textYes, style: AppTextStyles.text18),
    onPressed: () {
      _provider.remove(lotModel.id);
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text(_textTitle),
    content: Text(_textContent),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
