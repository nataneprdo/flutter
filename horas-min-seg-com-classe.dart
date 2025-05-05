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
  
  String msg = '';
  String _minutos = '';
  String _segundos = '';
  
  
  
  void setMsgHoras({double? resultado}){
      if (resultado !=null){
      setState(() {
        msg= 'Convertidos em minutos: ${resultado} min';
      });
      }
    else{
      setState(() {
        msg = 'Por favor, insira um nome e números válidos.';
      });
    }     
  }
  
   void setMsgSegundos({double? resultado}){
      if (resultado !=null){
      setState(() {
        msg= 'Convertidos em segundos: ${resultado} segundos';
      });
      }
    else{
      setState(() {
        msg = 'Por favor, insira um nome e números válidos.';
      });
    }     
  }
  
  
  

  void _horasMinutos() {
    final double? horas = double.tryParse(_horas.text);
    Converter calc = Converter();
 
    if (horas != null) {
      calc.horas = horas;
      calc.horasMinutos();
      setMsgHoras(resultado:calc.resultado);
    
    } else {
      setMsgHoras();
    }
  }
  
  
  void _horasSegundos() {
    final double? horas = double.tryParse(_horas.text);
    Converter calc = Converter();
 
    if (horas != null) {
      calc.horas = horas;
      calc.horasSegundos();
      setMsgSegundos(resultado:calc.resultado);
    
    } else {
      setMsgSegundos();
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
            msg,
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

class Converter {
  late double _horas;
  late double _resultado;
  
  //Getter
  double get horas => _horas;
  //Setter
  set horas(double newHoras) => _horas = newHoras;
  
  
   set resultado(double newResultado) => _resultado = newResultado;
  
  //Getter
  double get resultado => _resultado;
  
  void horasMinutos(){
    resultado = horas * 60;
  }
  
  void horasSegundos(){
    resultado = horas * (60 * 60);
  }
}