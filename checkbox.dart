import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Customizado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Alterado para azul para combinar com o estilo
      ),
      home: CheckboxSample(),
    );
  }
}

class CheckboxSample extends StatefulWidget {
  @override
  CheckboxSampleState createState() => CheckboxSampleState();
}

class CheckboxSampleState extends State<CheckboxSample> {
  Map<String, bool> checked = {
    'Desenv. Sistemas': false,
    'Automação': false,
    'Administração': false,
  };

  Map<String, bool> periodo = {
    'Diurno': false,
    'Matutino': false,
    'Noturno': false,
  };
  
  Map<String, bool> turma = {
    'Turma A': false,
    'Turma B': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio Checkbox'),
        backgroundColor: Colors.lightBlue[200], // Azul claro para o header
      ),
      backgroundColor: Colors.grey[200], // Fundo cinza claro
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSection('Cursos', checked),
              ElevatedButton(
                onPressed: () => _showSelected(checked, 'Cursos Selecionados'),
                child: const Text('Mostrar Cursos Selecionados'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[200],
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              _buildSection('Períodos', periodo),
              ElevatedButton(
                onPressed: () => _showSelected(periodo, 'Períodos Selecionados'),
                child: const Text('Mostrar Períodos Selecionados'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[200],
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              _buildSection('Turmas', turma),
              ElevatedButton(
                onPressed: () => _showSelected(turma, 'Turmas Selecionadas'),
                child: const Text('Mostrar Turmas Selecionadas'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[200],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, Map<String, bool> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...data.keys.map((key) => Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.lightBlue[100], // Azul claro para o card
          child: CheckboxListTile(
            title: Text(
              key,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            value: data[key],
            activeColor: Colors.blue, // Cor quando selecionado
            checkColor: Colors.white, // Cor do checkmark
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (newValue) {
              setState(() {
                data[key] = newValue ?? false;
              });
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        )).toList(),
      ],
    );
  }

  void _showSelected(Map<String, bool> data, String title) {
    final selected = data.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            selected.isNotEmpty
                ? selected.join(', ')
                : 'Nenhuma opção selecionada.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
