import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/controller/lot_controller.dart';
import 'package:raro_parking_challenge/app/core/core.dart';

class ToggleLotWidget extends StatefulWidget {
  @override
  _ToggleLotWidgetState createState() => _ToggleLotWidgetState();
}

class _ToggleLotWidgetState extends State<ToggleLotWidget> {
  static String _textAvaible = 'Dísponiveis';
  static String _textInUse = 'Em uso';

  EdgeInsetsGeometry _padding4 = EdgeInsets.all(4.0);
  EdgeInsetsGeometry _padding20 = EdgeInsets.all(20.0);

  SizedBox _spaceWidth = SizedBox(width: 8.0);

  List<Icon> _icons = [Icon(Icons.event_available), Icon(Icons.event_busy)];

  List<bool> _isSelected = [];

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<LotController>(context, listen: false);
    _isSelected = _provider.toggleLotSelected;

    return Padding(
      padding: _padding4,
      child: ToggleButtons(
        children: <Widget>[
          Container(
            padding: _padding4,
            child: Row(
              children: [
                _icons[0],
                _spaceWidth,
                Text(_textAvaible, style: AppTextStyles.text14),
              ],
            ),
          ),
          Container(
            padding: _padding20,
            child: Row(
              children: [
                _icons[1],
                _spaceWidth,
                Text(_textInUse, style: AppTextStyles.text14),
              ],
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            if (index == 0) {
              _provider.showAvailableLots = true;
              _provider.toggleLotSelected[0] = true;
              _provider.toggleLotSelected[1] = false;
            } else {
              _provider.showAvailableLots = false;
              _provider.toggleLotSelected[0] = false;
              _provider.toggleLotSelected[1] = true;
            }
          });
        },
        isSelected: _isSelected,
      ),
    );
  }
}
