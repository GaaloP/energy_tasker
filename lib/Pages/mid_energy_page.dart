import 'package:flutter/material.dart';
import 'package:energy_tasker/data/tasks_categories.dart';
import '../widgets/tasks_page_template.dart';

// Página que muestra tareas para cuando el usuario tiene energía media
class MidEnergyPage extends StatelessWidget {
  const MidEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      // Título mostrado en la AppBar
      title: 'Tareas - Energía Media',
      // Subtítulo
      subtitle: 'Día regular, tareas ligeras',
      // Icono representativo del estado de energía
      icon: '😒', 
      // Color del AppBar basado en la categoría de energía media
      appBarColor: categoryTasks[1]['color'],
      // Color de fondo de las tarjetas de tarea
      taskCardColor: categoryTasks[1]['taskCardColor'],
      // Lista de tareas asociadas a la categoría de energía media
      tasks: categoryTasks[1]['tasks'],
    );
  }
}
