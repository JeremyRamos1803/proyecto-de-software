import 'package:flutter/material.dart';
import 'package:flutter_application_1/bar%20graph/bar_graph.dart';
import 'package:flutter_application_1/widgets/segmented_buttons.dart'; // Importa el archivo donde tienes los botones
import 'package:flutter_application_1/widgets/radio_buttons.dart'; // Importa el archivo donde tienes los radio buttons

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SegmentedButtonExample(), // Botones en la parte superior
          ),
          SizedBox(height: 20), // Espacio entre los botones y el gráfico
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Expanded(
                    child: MyBarGraph(
                      weeklySummary: weeklySummary,
                    ),
                  ),
                  SizedBox(height: 20), // Espacio entre el gráfico y los radio buttons
                  RadioExample(), // Radio buttons debajo del gráfico
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
