//ATIVIDADE CALCULAR VALOR DE PRODUTO DE ACORDO COM QUANTIDADE


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Calcular Valor Produto')),
        body: ValorProdutoForm(),
      ),
    );
  }
}

class ValorProdutoForm extends StatefulWidget {
  @override
  _ValorProdutoFormState createState() => _ValorProdutoFormState();
}

class _ValorProdutoFormState extends State<ValorProdutoForm> {
  final TextEditingController _quantidade = TextEditingController();
  String _resultado = '';

  void _valorProduto() {
    final double? quantidade = double.tryParse(_quantidade.text);

    if (quantidade != null) {
      final double resultado = 50 * quantidade;

      setState(() {
        _resultado = 'O valor final do produto é RS$resultado';
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
            controller: _quantidade,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Quantidade',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _valorProduto,
            child: Text('Calcular valor do Produto'),
          ),
          SizedBox(height: 20),
          Text(
            _resultado,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}