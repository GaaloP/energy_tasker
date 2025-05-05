import 'package:flutter/material.dart';
import '../data/tasks_categories.dart';
import '../widgets/tasks_page_template.dart';

// Página que muestra tareas para cuando el usuario tiene alta energía
class MaxEnergyPage extends StatelessWidget {
  const MaxEnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyTaskPage(
      // Título mostrado en la AppBar
      title: 'Tareas - Energía Alta',
      // Subtítulo
      subtitle: '¡Hoy estás con toda la energía!',
      // Icono representativo del estado de energía
      icon: '😁',
      // Color del AppBar basado en la categoría de energía alta
      appBarColor: categoryTasks[0]['color'],
      // Color de fondo de las tarjetas de tarea
      taskCardColor: categoryTasks[0]['taskCardColor'],
      // Lista de tareas asociadas a la categoría de energía alta
      tasks: categoryTasks[0]['tasks'],
    );
  }
}
