import 'package:flutter/material.dart';
import 'package:energy_tasker/data/data_tasks.dart';
import 'package:energy_tasker/widgets/tasks_present.dart';

class MaxEnergyPage extends StatelessWidget {
  const MaxEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      title: 'Tareas - Energía Alta',
      subtitle: '¡Hoy estás con toda la energía!',
      icon: Icons.sentiment_very_satisfied,
      iconColor: Colors.teal,
      appBarColor: Colors.teal,
      taskColor: Color.fromARGB(255, 178, 251, 244),
      tasks: tareasMax,
    );
  }
}
