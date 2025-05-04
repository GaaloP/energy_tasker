import 'package:energy_tasker/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:energy_tasker/pages/all_tasks.dart';

class EnergyTaskPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color appBarColor;
  final Color taskColor;
  final List<Map<String, dynamic>> tasks;

  const EnergyTaskPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.appBarColor,
    required this.taskColor,
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
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () {
            Navigator.pop(context);
            FocusScope.of(context).unfocus(); // Para cerrar el teclado
          } 
        ),
        
        title: Text(widget.title),
        backgroundColor: widget.appBarColor,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(widget.icon, style: TextStyle( fontSize: 40)),
          Text(
            widget.subtitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          TaskList(
            tasks: widget.tasks,
            taskColor: widget.taskColor,
          ),
         ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton.icon(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllTasksPage()),
              );
              setState(() {}); // Para actualizar si hay cambios
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.appBarColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon: Icon(Icons.arrow_forward),
            label: Text(
              'Ver tus tareas',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.tasks, required this.taskColor});

  final List<Map<String, dynamic>> tasks;
  final Color taskColor;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 20),
        itemCount: widget.tasks.length,
        itemBuilder: (context, i) {
          final tarea = widget.tasks[i];
          final completada = tarea['completada'] ?? false;

          return TaskCard(
            tarea: tarea,
            completada: completada,
            colores: completada
                ? [Color.fromARGB(255, 180, 255, 183), Color.fromARGB(255, 239, 247, 240)]
                : [widget.taskColor, widget.taskColor],
            onTap: () {
              setState(() {
                tarea['completada'] = !completada;
              });
            },
          );
        },
      ),
    );
        
  }
}