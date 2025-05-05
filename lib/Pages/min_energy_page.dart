import 'package:flutter/material.dart';
import 'package:energy_tasker/data/tasks_categories.dart';
import '../widgets/tasks_page_template.dart';

// Página que muestra tareas para cuando el usuario tiene energía baja
class MinEnergyPage extends StatelessWidget {
  const MinEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      // Título mostrado en la AppBar
      title: 'Tareas - Energía Baja',
      // Subtítulo
      subtitle: 'No pasa nada, ve poco a poco',
      // Icono representativo del estado de energía
      icon: '🤒',
      // Color del AppBar basado en la categoría de energía baja
      appBarColor: categoryTasks[2]['color'],
      // Color de fondo de las tarjetas de tarea
      taskCardColor: categoryTasks[2]['taskCardColor'],
      // Lista de tareas asociadas a la categoría de energía baja
      tasks: categoryTasks[2]['tasks'],
    );
  }
}
