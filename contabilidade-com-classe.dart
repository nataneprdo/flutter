// ATIVIDADE CALCULAR VALOR DE SALÁRIO BASEADO EM FALTAS E HORAS EXTRAS

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Contabilidade')),
        body: SalarioForm(),
      ),
    );
  }
}

class SalarioForm extends StatefulWidget {
  @override
  _SalarioFormState createState() => _SalarioFormState();
}

class _SalarioFormState extends State<SalarioForm> {
  final TextEditingController _salarioBase = TextEditingController();
  final TextEditingController _faltas = TextEditingController();
  final TextEditingController _horas = TextEditingController();

  String msgSalarioHora = '';
  String msgDescontoFalta = '';
  String msgSalarioDesconto = '';
  String msgHoraExtra = '';
  String msgSalarioAcrescimo = '';

  void setMsgSalarioHora({double? resultado}) {
    if (resultado != null) {
      setState(() {
        msgSalarioHora = 'Valor Salário Hora é: ${resultado}';
      });
    } else {
      setState(() {
        msgSalarioHora = 'Por favor, insira um nome e números válidos.';
      });
    }
  }

  void setMsgDescontoFalta({double? resultado}) {
    if (resultado != null) {
      setState(() {
        msgDescontoFalta = 'Valor Desconto falta é: ${resultado}';
      });
    } else {
      setState(() {
        msgDescontoFalta = 'Por favor, insira um nome e números válidos.';
      });
    }
  }

  void setMsgSalarioDesconto({double? resultado}) {
    if (resultado != null) {
      setState(() {
        msgSalarioDesconto = 'Valor do Salário com Desconto: ${resultado}';
      });
    } else {
      setState(() {
        msgSalarioDesconto = 'Por favor, insira um nome e números válidos.';
      });
    }
  }

  void setMsgHoraExtra({double? resultado}) {
    if (resultado != null) {
      setState(() {
        msgHoraExtra = 'Valor Hora Extra: ${resultado}';
      });
    } else {
      setState(() {
        msgHoraExtra = 'Por favor, insira um nome e números válidos.';
      });
    }
  }

  void setMsgSalarioAcrescimo({double? resultado}) {
    if (resultado != null) {
      setState(() {
        msgSalarioAcrescimo = 'Salário com Acréscimo: ${resultado}';
      });
    } else {
      setState(() {
        msgSalarioAcrescimo = 'Por favor, insira um nome e números válidos.';
      });
    }
  }

  void _calcular() {
    final double? salarioBase = double.tryParse(_salarioBase.text);
    final int? faltas = int.tryParse(_faltas.text);
    final double? horas = double.tryParse(_horas.text);

    if (salarioBase != null && faltas != null && horas != null) {
      Contabilidade calc = Contabilidade();

      calc.salarioBase = salarioBase;
      calc.faltas = faltas;
      calc.horas = horas;

      calc.calcularSalarioHora();
      calc.calcularDescontoFalta();
      calc.calcularSalarioComDesconto();
      calc.calcularValorHoraExtra();
      calc.calcularSalarioComAcrescimo();

      setMsgSalarioHora(resultado: calc.salarioHora);
      setMsgDescontoFalta(resultado: calc.valorDescontoFalta);
      setMsgSalarioDesconto(resultado: calc.salarioDesconto);
      setMsgHoraExtra(resultado: calc.valorHoraExtra);
      setMsgSalarioAcrescimo(resultado: calc.salarioAcrescimo);
    } else {
      setMsgSalarioHora();
      setMsgDescontoFalta();
      setMsgSalarioDesconto();
      setMsgHoraExtra();
      setMsgSalarioAcrescimo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _salarioBase,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Salário Base',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          TextField(
            controller: _faltas,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Faltas (dias)',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          TextField(
            controller: _horas,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Horas Extras',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calcular,
            child: Text('Calcular'),
          ),
          SizedBox(height: 20),
          Text(msgSalarioHora),
          Text(msgDescontoFalta),
          Text(msgSalarioDesconto),
          Text(msgHoraExtra),
          Text(msgSalarioAcrescimo),
        ],
      ),
    );
  }
}

// Classe externa para cálculos
class Contabilidade {
  double _salarioBase = 0,
      _salarioHora = 0,
      _horas = 0,
      _valorDescontoFalta = 0,
      _salarioDesconto = 0,
      _valorHoraExtra = 0,
      _salarioAcrescimo = 0;
  int _faltas = 0;

  double get salarioBase => _salarioBase;
  set salarioBase(double newSalarioBase) => _salarioBase = newSalarioBase;

  int get faltas => _faltas;
  set faltas(int newFaltas) => _faltas = newFaltas;

  double get horas => _horas;
  set horas(double newHoras) => _horas = newHoras;

  double get salarioHora => _salarioHora;
  double get valorDescontoFalta => _valorDescontoFalta;
  double get salarioDesconto => _salarioDesconto;
  double get valorHoraExtra => _valorHoraExtra;
  double get salarioAcrescimo => _salarioAcrescimo;

  void calcularSalarioHora() {
    _salarioHora = _salarioBase / 240;
  }

  void calcularDescontoFalta() {
    _valorDescontoFalta = (_faltas * 8) * _salarioHora;
  }

  void calcularSalarioComDesconto() {
    _salarioDesconto = _salarioBase - _valorDescontoFalta;
  }

  void calcularValorHoraExtra() {
    _valorHoraExtra = _salarioHora * 1.5;
  }

  void calcularSalarioComAcrescimo() {
    _salarioAcrescimo = _salarioBase + (_horas * _valorHoraExtra);
  }
}