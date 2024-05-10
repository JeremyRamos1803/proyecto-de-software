import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecetasScreen(),
    );
  }
}

class RecetasScreen extends StatefulWidget {
  @override
  _RecetasScreenState createState() => _RecetasScreenState();
}

class _RecetasScreenState extends State<RecetasScreen> {
  List<dynamic> _recetas = [];

  @override
  void initState() {
    super.initState();
    _fetchRecetas();
  }

  Future<void> _fetchRecetas() async {
    final response = await http.get(Uri.parse('http://localhost:5000/recetas'));
    if (response.statusCode == 200) {
      setState(() {
        _recetas = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load recetas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
      ),
      body: _recetas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recetas.length,
              itemBuilder: (BuildContext context, int index) {
                return RecetaTile(receta: _recetas[index]);
              },
            ),
    );
  }
}

class RecetaTile extends StatelessWidget {
  final Map<String, dynamic> receta;

  RecetaTile({required this.receta});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[300], // Color de fondo
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
        border: Border.all(color: Colors.grey), // Borde
      ),
      margin: EdgeInsets.all(8), // Margen exterior
      child: ExpansionTile(
        title: Text(
          receta['nombre'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          ListTile(
            title: Text('Ingredientes:'),
            subtitle: Text(receta['ingredientes']),
          ),
          ListTile(
            title: Text('Instrucciones:'),
            subtitle: Text(receta['instrucciones']),
          ),
        ],
      ),
    );
  }
}