import 'package:energy_tasker/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:energy_tasker/pages/all_tasks_page.dart';

/// Página que muestra tareas agrupadas por tipo de energía (alta, media, baja)
class EnergyTaskPage extends StatefulWidget {
  final String title; // Título mostrado en la AppBar
  final String subtitle; // Subtítulo mostrado debajo del ícono
  final String icon; // Emoji o símbolo que representa el tipo de energía
  final Color appBarColor; // Color del AppBar
  final Color taskCardColor; // Color de las tarjetas de tarea (no completadas)
  final List<Map<String, dynamic>> tasks; // Lista de tareas a mostrar

  const EnergyTaskPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.appBarColor,
    required this.taskCardColor,
    required this.tasks,
  });

  @override
  State<EnergyTaskPage> createState() => _EnergyTaskPageState();
}

class _EnergyTaskPageState extends State<EnergyTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Botón de regreso
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
            FocusScope.of(context).unfocus(); // Cierra el teclado si está activo
          },
        ),
        title: Text(widget.title),
        backgroundColor: widget.appBarColor,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(widget.icon, style: const TextStyle(fontSize: 40)), // Icono/emoji de energía
          Text(
            widget.subtitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          TaskList(
            tasks: widget.tasks,
            taskColor: widget.taskCardColor,
          ),
        ],
      ),
      // Botón inferior para ir a la vista de todas las tareas
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton.icon(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AllTasksPage()),
              );
              setState(() {}); // Refresca la vista al volver
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.appBarColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text(
              'Ver tus tareas',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget que representa la lista de tareas mostradas
class TaskList extends StatefulWidget {
  final List<Map<String, dynamic>> tasks;
  final Color taskColor;

  const TaskList({
    super.key,
    required this.tasks,
    required this.taskColor,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: widget.tasks.length,
        itemBuilder: (context, i) {
          final tarea = widget.tasks[i];
          final completada = tarea['completada'] ?? false;

          return TaskCard(
            tarea: tarea,
            completada: completada,
            colores: completada
                // Si la tarea está completada, usar colores suaves
                ? [
                    const Color.fromARGB(255, 180, 255, 183),
                    const Color.fromARGB(255, 239, 247, 240),
                  ]
                // Si no, usar el color principal
                : [widget.taskColor, widget.taskColor],
            onTap: () {
              setState(() {
                tarea['completada'] = !completada; // Alterna estado de completado
              });
            },
          );
        },
      ),
    );
  }
}
