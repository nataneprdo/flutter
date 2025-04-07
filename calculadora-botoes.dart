import 'package:flutter/material.dart';


void main() {

  runApp(MyApp());

}


class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Somador de Números')),
        body: SomadorForm(),
      ),

    );

  }

}


class SomadorForm extends StatefulWidget {

  @override

  _SomadorFormState createState() => _SomadorFormState();

}


class _SomadorFormState extends State<SomadorForm> {

  final TextEditingController _numero1 = TextEditingController();

  final TextEditingController _numero2 = TextEditingController();

  String _resultado = '';


  void _somar() {

    final double? numero1 = double.tryParse(_numero1.text);

    final double? numero2 = double.tryParse(_numero2.text);


    if (numero1 != null && numero2 != null) {

      final double resultado = numero1 + numero2;

      setState(() {

        _resultado = 'Resultado: $resultado';

      });

    } else {

      setState(() {

        _resultado = 'Por favor, insira números válidos.';

      });

    }

  }
  
   void _subtrair() {

    final double? numero1 = double.tryParse(_numero1.text);

    final double? numero2 = double.tryParse(_numero2.text);


    if (numero1 != null && numero2 != null) {

       final double resultado = numero1 - numero2;

      setState(() {

        _resultado = 'Resultado: $resultado';

      });

    } else {

      setState(() {

        _resultado = 'Por favor, insira números válidos.';

      });

    }

  }
  
  void _multiplicar() {

    final double? numero1 = double.tryParse(_numero1.text);

    final double? numero2 = double.tryParse(_numero2.text);


    if (numero1 != null && numero2 != null) {

       final double resultado = numero1 * numero2;

      setState(() {

        _resultado = 'Resultado: $resultado';

      });

    } else {

      setState(() {

        _resultado = 'Por favor, insira números válidos.';

      });

    }

  }
  
    void _divisao() {

    final double? numero1 = double.tryParse(_numero1.text);

    final double? numero2 = double.tryParse(_numero2.text);


    if (numero1 != null && numero2 != null && numero2 != 0) {

       final double resultado = numero1 * numero2;

      setState(() {

        _resultado = 'Resultado: $resultado';

      });

    } else {

      setState(() {

        _resultado = 'Por favor, insira números válidos.';

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
            controller: _numero1,
            decoration: InputDecoration(labelText: 'Número 1'),
            keyboardType: TextInputType.number,
          ),

          TextField(
            controller: _numero2,
            decoration: InputDecoration(labelText: 'Número 2'),
            keyboardType: TextInputType.number,

          ),

          SizedBox(height: 10),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            
            children:[
            ElevatedButton(
              onPressed: _somar,
              child: Text('Somar'),
           ),
          
          SizedBox(height: 10),
 
          ElevatedButton(
            onPressed: _subtrair,
            child: Text('Subtrair'),

          ),
          SizedBox(height: 10),
 
          ElevatedButton(
            onPressed: _multiplicar,
            child: Text('Multiplicar'),

          ),
          SizedBox(height: 10),
 
          ElevatedButton(
            onPressed: _divisao,
            child: Text('Dividir'),

          ),
          ],
          ),
          SizedBox(height: 10),
          Text(_resultado, style: TextStyle(fontSize: 24)),

        ],

      ),

    );

  }

}