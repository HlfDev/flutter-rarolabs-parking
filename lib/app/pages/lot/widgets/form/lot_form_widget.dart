import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/models/lot_model.dart';
import 'package:raro_parking_challenge/app/provider/lot_provider.dart';

class LotFormWidget extends StatefulWidget {
  const LotFormWidget({Key? key}) : super(key: key);

  @override
  _LotFormWidgetState createState() => _LotFormWidgetState();
}

class _LotFormWidgetState extends State<LotFormWidget> {
  final Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();

  final _controllerModel = TextEditingController();
  final _controllerPlate = TextEditingController();
  final _controllerLotCode = TextEditingController();
  final _controllerValuePerHour = TextEditingController();

  void _loadFormData(LotModel lotModel) {
    _formData['id'] = lotModel.id;
    _formData['lotCode'] = lotModel.lotCode;
    _formData['emptySpace'] = lotModel.emptySpace;
  }

  @override
  Widget build(BuildContext context) {
    final LotModel lotModel = LotModel(
      id: '',
      lotCode: '',
      emptySpace: true,
    );

    _loadFormData(lotModel);

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
                          return 'Preencha o Código da Vaga';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['lotCode'] = value ?? '',
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
                          Provider.of<LotProvider>(context, listen: false).put(
                            LotModel(
                              id: _formData['id'] ?? '',
                              lotCode: _formData['lotCode'] ?? '',
                              emptySpace: _formData['emptySpace'],
                            ),
                          );

                          _controllerModel.text = '';
                          _controllerPlate.text = '';
                          _controllerLotCode.text = '';
                          _controllerValuePerHour.text = '';
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
                        'Cadastrar Vaga',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.local_parking,
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
