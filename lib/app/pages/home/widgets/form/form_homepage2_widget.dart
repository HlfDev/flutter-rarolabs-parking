import 'package:flutter/material.dart';
import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';
import 'package:raro_parking_challenge/app/shared/widgets/button/elevated_button_rounded.dart';

class FormHomePage2Widget extends StatefulWidget {
  const FormHomePage2Widget({Key? key}) : super(key: key);

  @override
  _FormHomePage2WidgetState createState() => _FormHomePage2WidgetState();
}

class _FormHomePage2WidgetState extends State<FormHomePage2Widget> {
  final Map<String, dynamic> _formData = {};

  void _loadFormData(ParkingLotModel parkingModel) {
    _formData['id'] = parkingModel.id;
    _formData['model'] = parkingModel.model;
    _formData['plate'] = parkingModel.plate;
    _formData['lotCode'] = parkingModel.lotCode;
    _formData['entryDate'] = parkingModel.entryDate;
    _formData['departureDate'] = parkingModel.departureDate;
  }

  @override
  Widget build(BuildContext context) {
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
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.local_shipping),
                      labelText: 'Modelo',
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.monetization_on),
                      labelText: 'Valor pela Hora',
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
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  label: Text(
                    'Alterar Campos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
