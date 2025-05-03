import 'package:flutter/material.dart';
import '../data/tasks_categories.dart';
import '../widgets/tasks_page_template.dart';


class MaxEnergyPage extends StatelessWidget {
  const MaxEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      title: 'Tareas - Energía Alta',
      subtitle: '¡Hoy estás con toda la energía!',
      icon: Icons.sentiment_very_satisfied,
      color: categoriTasks[0]['color'],
      appBarColor: categoriTasks[0]['color'],
      taskColor: Color.fromARGB(255, 178, 251, 244),
      tasks: categoriTasks[0]['tareas'],
    );
  }
}
