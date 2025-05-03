import 'package:flutter/material.dart';
import 'package:energy_tasker/data/data_tasks.dart';
import 'package:energy_tasker/widgets/tasks_present.dart';

class MinEnergyPage extends StatelessWidget {
  const MinEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      title: 'Tareas - Energía Baja',
      subtitle: 'No pasa nada, ve poco a poco',
      icon: Icons.sentiment_very_dissatisfied,
      iconColor: Colors.pink,
      appBarColor: Colors.pinkAccent,
      taskColor: Color.fromARGB(255, 252, 228, 236),
      tasks: tareasMin,
    );
  }
}
