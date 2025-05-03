import 'package:flutter/material.dart';
import '../data/max_energy_tasks.dart';
import '../widgets/tasks_page_template.dart';

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
