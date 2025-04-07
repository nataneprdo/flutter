//ATIVIDADE CONVERTER HORAS EM MINUTOS E SEGUNDOS 

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Horas em Minutos e Segundos')),
        body: HorasSegundosForm(),
      ),
    );
  }
}

class HorasSegundosForm extends StatefulWidget {
  @override
  _HorasSegundosFormState createState() => _HorasSegundosFormState();
}

class _HorasSegundosFormState extends State<HorasSegundosForm> {
  final TextEditingController _horas = TextEditingController();
  String _resultado = '';
  String _minutos = '';
  String _segundos = '';

  void _horasMinutos() {
    final double? horas = double.tryParse(_horas.text);

    if (horas != null) {
      final double resultado = horas * 60;

      setState(() {
        _resultado = '$horas horas convertidos em minutos fica: $resultado min';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira um nome e números válidos.';
      });
    }
  }
  
  void _horasSegundos() {
    final double? horas = double.tryParse(_horas.text);

    if (horas != null) {
      final double resultado = horas * (60 * 60);

      setState(() {
        _resultado = '$horas horas convertidos em segundos fica: $resultado seg';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira um nome e números válidos.';
      });
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          TextField(
            controller: _horas,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Horas',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _horasMinutos,
            child: Text('Calcular em Minutos'),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: _horasSegundos,
            child: Text('Calcular em Segundos'),
          ),
          SizedBox(height: 20),
          Text(
            _resultado,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            _minutos,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            ),
          SizedBox(height: 20),
          Text(
            _segundos,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}