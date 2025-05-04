import 'package:flutter/material.dart';
import 'package:energy_tasker/data/tasks_categories.dart';
import '../widgets/tasks_page_template.dart';

class MidEnergyPage extends StatelessWidget {
  const MidEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      title: 'Tareas - Energía Media',
      subtitle: 'Día regular, tareas ligeras',
      icon: '😒',
      appBarColor: categoriTasks[1]['color'],
      taskColor: categoriTasks[1]['colorCard'],
      tasks: categoriTasks[1]['tareas'],
    );
  }
}
