//ATIVIDADE CALCULAR VALOR DE PRODUTO DE ACORDO COM QUANTIDADE COM CLASSE


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
  
  String msg = '';
  
  
  void setMsg({double? resultado}){
      if (resultado !=null){
      setState(() {
        msg= 'O valor final do produto é RS$resultado';
      });
      }
    else{
      setState(() {
        msg = 'Por favor, insira um nome e números válidos.';
      });
    }     
  }
  

  void _valorProduto() {
    final double? quantidade = double.tryParse(_quantidade.text);
    Calcular calc = Calcular();
 
    if (quantidade != null) {
      calc.quantidade = quantidade;
      calc.valorProduto();
      setMsg(resultado:calc.resultado);
    
    } else {
      setMsg();
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

class Calcular {
  late double _quantidade;
  late double _resultado;
  
  //Getter
  double get quantidade => _quantidade;
  //Setter
  set quantidade(double newQuantidade) => _quantidade = newQuantidade;
  
  //Getter
  double get resultado => _resultado;
  //Setter
  set resultado(double newResultado) => _resultado = newResultado;
  
  //metodo para calcular a venda
  
  void valorProduto(){
    resultado = 500 * quantidade;
  }
  
}