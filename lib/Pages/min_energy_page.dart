import 'package:flutter/material.dart';
import 'package:energy_tasker/data/tasks_categories.dart';
import '../widgets/tasks_page_template.dart';

class MinEnergyPage extends StatelessWidget {
  const MinEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      title: 'Tareas - Energía Baja',
      subtitle: 'No pasa nada, ve poco a poco',
      icon: '🤒',
      appBarColor: categoriTasks[2]['color'],
      taskColor: categoriTasks[2]['colorCard'],
      tasks: categoriTasks[2]['tareas'],
    );
  }
}
