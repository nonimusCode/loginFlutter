

import 'package:flutter/material.dart';


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  //Creando e inicializar un estado con override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  //va la parte lógica
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  String _selectedOperation="";
  double _result=0.0;
  void _calculateResultByTypeOperation(){
    double number1 = double.tryParse(_number1Controller.text) ?? 0.0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0.0;
    setState(() {
      if (_selectedOperation=="") {
        _result=0.0;
        return;
      }
      if (_selectedOperation=="Suma") {
        _result= number1+number2;
        return;
      }
      if (_selectedOperation=="Resta") {
        _result= number1-number2;
        return;
      }
      if (_selectedOperation=="Multiplicación") {
        _result= number1*number2;
        return;
      }
      if (_selectedOperation=="División") {
        _result= number1/number2;
        return;
      }
    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20.0),
            DropdownButton<String>(
              value: _selectedOperation.isNotEmpty ? _selectedOperation : null,
              hint: Text('Seleccione una operación'),
              items: <String>['Suma', 'Resta', 'Multiplicación', 'División']
                  .map((String operation) {
                    //ventana desplegable
                return DropdownMenuItem<String>(
                  value: operation,
                  child: Text(operation),
                );
              }).toList(),//convierte una lista iterable en una lista normal o array
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOperation = newValue!;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _calculateResultByTypeOperation();
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Resultado: $_result',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

}
