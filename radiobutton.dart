import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RadioButtonSample(),
    );
  }
}

class RadioButtonSample extends StatefulWidget {
  @override
  _RadioButtonSampleState createState() => _RadioButtonSampleState();
}

class _RadioButtonSampleState extends State<RadioButtonSample> {
  String? selectedCurso;
  String? selectedPeriodo;
  String? selectedTurma;

  final List<String> cursos = ['Desenv. Sistemas', 'Automação', 'Administração'];
  final List<String> periodos = ['Diurno', 'Matutino', 'Noturno'];
  final List<String> turma = ['Turma A', 'Turma B'];

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Exercicio RadioButton'),
      backgroundColor: Colors.lightBlue[200], // Azul para o header
      elevation: 4,
    ),
    backgroundColor: Colors.grey[200],
    body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSection('Selecionar Curso', cursos, (value) {
              setState(() => selectedCurso = value);
            }, selectedCurso),
            
            const SizedBox(height: 16),
            
            _buildSection('Selecionar Período', periodos, (value) {
              setState(() => selectedPeriodo = value);
            }, selectedPeriodo),
            
            const SizedBox(height: 16),
            
            _buildSection('Selecionar Turma', turma, (value) {
              setState(() => selectedTurma = value);
            }, selectedTurma),
            
            const SizedBox(height: 24),
            
            ElevatedButton(
              onPressed: _showSelected, 
              child: const Text('Mostrar Selecionados'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> options, ValueChanged<String?> onChanged, String? groupValue) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100], // Azul claro
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...options.map((option) => RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: groupValue,
                onChanged: onChanged,
                contentPadding: EdgeInsets.zero,
                dense: true,
              )),
        ],
      ),
    );
  }

  void _showSelected() {
    String selected = 'Curso: ${selectedCurso ?? "Nenhum selecionado"}\n'
                     'Período: ${selectedPeriodo ?? "Nenhum selecionado"}\n'
                     'Turma: ${selectedTurma ?? "Nenhum selecionado"}'; // Corrigido aqui

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Itens Selecionados'),
        content: Text(selected),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

