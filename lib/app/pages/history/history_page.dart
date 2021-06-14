import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Nenhuma entrada ou saida de veiculos encontrada ',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 32.0)),
        Image.asset('assets/images/empty_history.png'),
      ],
    );
  }
}
