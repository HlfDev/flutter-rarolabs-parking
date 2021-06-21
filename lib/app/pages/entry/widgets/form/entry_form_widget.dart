import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/controller/lot_controller.dart';
import 'package:raro_parking_challenge/app/controller/parking_controller.dart';
import 'package:raro_parking_challenge/app/models/parking_model.dart';

class EntryFormWidget extends StatefulWidget {
  const EntryFormWidget({Key? key}) : super(key: key);

  @override
  _EntryFormWidgetState createState() => _EntryFormWidgetState();
}

class _EntryFormWidgetState extends State<EntryFormWidget> {
  static String _id = 'id';
  static String _model = 'model';
  static String _plate = 'plate';
  static String _lotCode = 'lotCode';
  static String _entryDate = 'entryDate';
  static String _departureDate = 'departureDate';

  static String _validatorModel = 'Preencha o Modelo';
  static String _validatorPlate = 'Preencha a Placa';

  static String _emptyText = '';

  final Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();

  final _controllerModel = TextEditingController();
  final _controllerPlate = TextEditingController();
  final _controllerLotCode = TextEditingController();
  final _controllerValuePerHour = TextEditingController();

  void _loadFormData(ParkingModel parkingModel) {
    _formData[_id] = parkingModel.id;
    _formData[_model] = parkingModel.model;
    _formData[_plate] = parkingModel.plate;
    _formData[_lotCode] = parkingModel.lotCode;
    _formData[_entryDate] = parkingModel.entryDate;
    _formData[_departureDate] = parkingModel.departureDate;
  }

  var dropdownValue;

  @override
  Widget build(BuildContext context) {
    final ParkingModel parkingModel = ParkingModel(
      departureDate: _emptyText,
      entryDate: _emptyText,
      id: _emptyText,
      lotCode: _emptyText,
      model: _emptyText,
      plate: _emptyText,
    );

    final LotController _lotList = Provider.of(
      context,
      listen: true,
    );

    _loadFormData(parkingModel);

    return Form(
      key: _formKey,
      child: Card(
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
                      controller: _controllerModel,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return _validatorModel;
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['model'] = value ?? '',
                      keyboardType: TextInputType.text,
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
                  Expanded(
                    child: TextFormField(
                      controller: _controllerPlate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return _validatorPlate;
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['plate'] = value ?? '',
                      keyboardType: TextInputType.text,
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
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Icon(Icons.tag, color: Colors.grey),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        hint: Text(
                          "Selecione a Vaga",
                          style: TextStyle(fontSize: 16),
                        ),
                        isExpanded: true,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        style: TextStyle(color: Colors.grey),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: _lotList.items
                            .where((e) => e.emptySpace == true)
                            .map((e) => e.lotCode)
                            .toList()
                            .map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          if (dropdownValue == null) {
                            showAlertDialog(context);
                            return;
                          }
                          Provider.of<LotController>(context, listen: false)
                              .updateStatus(dropdownValue, false);

                          Provider.of<ParkingController>(context, listen: false)
                              .put(
                            ParkingModel(
                              id: _formData[_id] ?? _emptyText,
                              departureDate: _emptyText,
                              entryDate: '${DateTime.now()}',
                              lotCode: dropdownValue ?? _emptyText,
                              model: _formData[_model] ?? _emptyText,
                              plate: _formData[_plate] ?? _emptyText,
                            ),
                          );

                          _controllerModel.text = _emptyText;
                          _controllerPlate.text = _emptyText;
                          _controllerLotCode.text = _emptyText;
                          _controllerValuePerHour.text = _emptyText;

                          dropdownValue = null;
                        }
                      },
                      style: ElevatedButton.styleFrom(
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
                        'Efetuar Entrada',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.garage,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alerta"),
    content: Text("Selecione uma Vaga para Efetuar a Entrada"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
