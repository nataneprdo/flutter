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
        appBar: AppBar(title: Text('Nome e Ano de Nascimento')),
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
  final TextEditingController _anonascimento = TextEditingController();
  
  String msg = '';
  
  
  void setMsgIdade({double? resultado}){
      if (resultado !=null){
      setState(() {
        msg= 'Idade: ${resultado} anos';
      });
      }
    else{
      setState(() {
        msg = 'Por favor, insira um nome e números válidos.';
      });
    }     
  }
  

  void _idadeAproximada() {
    final double? anonascimento = double.tryParse(_anonascimento.text);
    Idade calc = Idade();
 
    if (anonascimento != null) {
      calc.anonascimento = anonascimento;
      calc.idadeAproximada();
      setMsgIdade(resultado:calc.resultado);
    
    } else {
      setMsgIdade();
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
            controller: _anonascimento,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ano Nascimento',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _idadeAproximada,
            child: Text('Calcular'),
          ),
          SizedBox(height: 20),
          Text(
            msg,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Idade {
  late double _anonascimento;
  late double _resultado;
  
  //Getter
  double get anonascimento => _anonascimento;
  //Setter
  set anonascimento(double newAnonascimento) => _anonascimento = newAnonascimento;
  
  //Getter
  double get resultado => _resultado;
  //Setter
  set resultado(double newResultado) => _resultado = newResultado;
  
  //metodo para calcular a venda
  
  void idadeAproximada(){
    resultado = 2025 - anonascimento;
  }
  
}