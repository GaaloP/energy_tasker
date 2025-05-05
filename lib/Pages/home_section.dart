import 'package:flutter/material.dart';

// Pantalla principal de bienvenida
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mensaje de bienvenida
          Text(
            'Bienvenido, Pablo',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          // Sección para indicar el estado de ánimo/energía
          const EnergyMoodSelector(),
        ],
      ),
    );
  }
}

// Widget que permite al usuario seleccionar cómo se siente
class EnergyMoodSelector extends StatelessWidget {
  const EnergyMoodSelector({
    super.key,
    this.content = const SizedBox.shrink(),
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 118, 187, 119),
          width: 2,
        ),
      ),
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pregunta de estado de ánimo
            const Text(
              "¿Cómo te sientes hoy?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Opciones de selección mediante emojis
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Opción: alta energía
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/max');
                  },
                  child: const Text("😄", style: TextStyle(fontSize: 40)),
                ),
                // Opción: energía media
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mid');
                  },
                  child: const Text("😒", style: TextStyle(fontSize: 40)),
                ),
                // Opción: baja energía
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/min');
                  },
                  child: const Text("🤒", style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
