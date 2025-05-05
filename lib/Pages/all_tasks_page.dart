import 'package:energy_tasker/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:energy_tasker/data/tasks_categories.dart';

// Página que muestra todas las tareas agrupadas por categoría
class AllTasksPage extends StatefulWidget {
  const AllTasksPage({super.key});

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  // Lista de grupos de tareas por categoría
  final List<Map<String, dynamic>> taskGroups = categoryTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con botón de retroceso y título
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context), // Regresa a la pantalla anterior
        ),
        title: const Text('Todas las Tareas'),
        backgroundColor: const Color.fromARGB(255, 171, 107, 255),
        foregroundColor: Colors.black87,
        elevation: 0,
      ),

      // Contenido scrollable que muestra todas las tareas
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recorre cada grupo de tareas (por categoría)
            ...taskGroups.map((group) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  
                  // Nombre de la categoría con estilo personalizado
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      group['category'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: group['color'],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Lista de tareas dentro del grupo
                  ...group['tasks'].map<Widget>((task) {
                    final bool isCompleted = task['completada'] ?? false;

                    return TaskCard(
                      tarea: task,
                      completada: isCompleted,
                      colores: isCompleted
                          ? [
                              const Color.fromARGB(255, 180, 255, 183),
                              const Color.fromARGB(255, 239, 247, 240),
                            ]
                          : [
                              group['taskCardColor'],
                              group['taskCardColor'],
                            ],
                      // Alterna el estado de completado al hacer tap
                      onTap: () {
                        setState(() {
                          task['completada'] = !isCompleted;
                        });
                      },
                    );
                  }).toList(),
                ],
              );
            }).toList(),

            const SizedBox(height: 30), // Espacio final
          ],
        ),
      ),
    );
  }
}
