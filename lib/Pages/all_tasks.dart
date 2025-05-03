import 'package:energy_tasker/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:energy_tasker/data/data_tasks.dart';

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({super.key});

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  List<Map<String, dynamic>> get tareas => [
        {
          'categoria': 'Alta energía',
          'color': Colors.teal,
          'colorcard': const Color.fromARGB(255, 178, 251, 244),
          'tareas': tareasMax,
        },
        {
          'categoria': 'Energía media',
          'color': Colors.blueAccent,
          'colorcard': const Color.fromARGB(255, 187, 222, 251),
          'tareas': tareasMid,
        },
        {
          'categoria': 'Baja energía',
          'color': Colors.pink,
          'colorcard': const Color.fromARGB(255, 252, 228, 236),
          'tareas': tareasMin,
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Todas las Tareas'),
        backgroundColor: Colors.blueGrey[100],
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...tareas.map((grupo) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      grupo['categoria'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: grupo['color'],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...grupo['tareas'].map<Widget>((tarea) {
                    bool completada = tarea['completada'] ?? false;

                    return TaskCard(
    tarea: tarea,
    completada: completada,
    colores: completada
        ? const [
            Color.fromARGB(255, 180, 255, 183),
            Color.fromARGB(255, 239, 247, 240),
          ]
        : [
            grupo['colorcard'],
            grupo['colorcard'],
          ],
    onTap: () {
      setState(() {
        tarea['completada'] = !completada;
      });
    },
  );
}).toList(),
                ],
              );
            }).toList(),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navega a la pantalla de progreso (pendiente)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[300],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                ),
                icon: const Icon(Icons.auto_graph_rounded),
                label: const Text(
                  'Ver tu progreso',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
