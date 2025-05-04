import 'package:energy_tasker/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:energy_tasker/data/tasks_categories.dart';

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({super.key});

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  final tareas = categoriTasks;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Todas las Tareas'),
        backgroundColor: Color.fromARGB(255, 171, 107, 255),
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...tareas.map((grupo) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      grupo['categoria'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: grupo['color'],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ...grupo['tareas'].map<Widget>((tarea) {
                    bool completada = tarea['completada'] ?? false;
                    return TaskCard(
                      tarea: tarea,
                      completada: completada,
                      colores: completada ?
                        [ Color.fromARGB(255, 180, 255, 183), Color.fromARGB(255, 239, 247, 240), ]
                      : [ grupo['colorCard'], grupo['colorCard'], ],
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
            SizedBox(height: 30),
            ],
        ),
      ),
    );
  }
}
