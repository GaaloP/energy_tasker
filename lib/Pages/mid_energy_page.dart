import 'package:flutter/material.dart';
import 'package:energy_tasker/data/data_tasks.dart';
import 'package:energy_tasker/widgets/tasks_present.dart';

class MidEnergyPage extends StatelessWidget {
  const MidEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      title: 'Tareas - Energía Media',
      subtitle: 'Día regular, tareas ligeras',
      icon: Icons.sentiment_neutral,
      iconColor: Colors.blueGrey,
      appBarColor: Colors.blueAccent,
      taskColor: Color.fromARGB(255, 187, 222, 251),
      tasks: tareasMid,
    );
  }
}
