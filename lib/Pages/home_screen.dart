import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido Pablo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            EnergyForm(
            ),
          ],
        ),
    );
  }
}
class EnergyForm extends StatelessWidget {
  const EnergyForm({
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
          color: Color.fromARGB(255, 118, 187, 119),
          width: 2),
      ),
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("¿Cómo te sientes hoy?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/max');
                  },
                  child: Text("😄", style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mid');
                  },
                  child: Text("😒", style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/min');
                  },
                  child: Text("🤒", style: TextStyle(fontSize: 40)),
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}