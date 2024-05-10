import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({Key? key}) : super(key: key);

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character;

  @override
  void initState() {
    super.initState();
    _character = SingingCharacter.Barras; // Selecciona un valor predeterminado
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Dos columnas
      shrinkWrap: true,
      childAspectRatio: 2.5, // Relación de aspecto para reducir el espacio entre los elementos
      children: [
        RadioListTile<SingingCharacter>(
          title: const Text('Barras'),
          value: SingingCharacter.Barras,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Lineas'),
          value: SingingCharacter.Lineas,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Pastel'),
          value: SingingCharacter.Pastel,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Dona'),
          value: SingingCharacter.Dona,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}

enum SingingCharacter { Barras, Lineas, Pastel, Dona }
