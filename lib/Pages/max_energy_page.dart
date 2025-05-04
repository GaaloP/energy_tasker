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
      icon: '😁',
      appBarColor: categoriTasks[0]['color'],
      taskColor: categoriTasks[0]['colorCard'],
      tasks: categoriTasks[0]['tareas'],
    );
  }
}
