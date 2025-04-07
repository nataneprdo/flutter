import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Nome e Ano de Nascimento')),
        body: AnoForm(),
      ),
    );
  }
}

class AnoForm extends StatefulWidget {
  @override
  _AnoFormState createState() => _AnoFormState();
}

class _AnoFormState extends State<AnoForm> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _anonascimento = TextEditingController();
  String _resultado = '';
  String _dias = '';
  String _meses = '';

  void _idadeAproximada() {
    final double? anonascimento = double.tryParse(_anonascimento.text);
    final String nome = _nome.text;

    if (anonascimento != null && nome.isNotEmpty) {
      final double resultado = 2025 - anonascimento;

      setState(() {
        _resultado = 'Nome: $nome\nIdade Aproximada: $resultado anos';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira um nome e números válidos.';
      });
    }
  }
  
  void _diasVividos() {
    final double? anonascimento = double.tryParse(_anonascimento.text);
    final String nome = _nome.text;

    if (anonascimento != null && nome.isNotEmpty) {
      final double resultado = 2025 - anonascimento;
      final double dias = resultado  * 365;

      setState(() {
        _resultado = 'Nome: $nome\nIdade Aproximada: $resultado anos';
        _dias = 'Portanto, $nome\nviveu: $dias dias';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira um nome e números válidos.';
      });
    }
  }
  
   void _mesesVividos() {
    final double? anonascimento = double.tryParse(_anonascimento.text);
    final String nome = _nome.text;

    if (anonascimento != null && nome.isNotEmpty) {
      final double resultado = 2025 - anonascimento;
      final double meses = resultado  * 12;

      setState(() {
        _resultado = 'Nome: $nome\nIdade Aproximada: $resultado anos';
        _meses = 'Portanto, $nome\nviveu: $meses meses';
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
          TextField(
            controller: _nome,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Digite seu nome',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _anonascimento,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ano de Nascimento',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _idadeAproximada,
            child: Text('Calcular Idade Aproximada'),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: _diasVividos,
            child: Text('Calcular dias vividos'),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: _mesesVividos,
            child: Text('Calcular meses vividos'),
          ),
          SizedBox(height: 20),
          Text(
            _resultado,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            _dias,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            ),
          SizedBox(height: 20),
          Text(
            _meses,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}