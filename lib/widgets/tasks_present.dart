import 'package:flutter/material.dart';
import 'package:energy_tasker/pages/all_tasks.dart';

class EnergyTaskPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color appBarColor;
  final Color taskColor;
  final List<Map<String, dynamic>> tasks;

  const EnergyTaskPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
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
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.title),
        backgroundColor: widget.appBarColor,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Icon(widget.icon, size: 80, color: widget.iconColor),
          Text(
            widget.subtitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: widget.tasks.length,
              itemBuilder: (context, i) {
                final tarea = widget.tasks[i];
                final completada = tarea['completada'] ?? false;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tarea['completada'] = !completada;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: completada
                            ? [Color.fromARGB(255, 180, 255, 183), Color.fromARGB(255, 239, 247, 240)]
                            : [widget.taskColor, widget.taskColor],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tarea['titulo'],
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  decoration: completada ? TextDecoration.lineThrough : TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                tarea['descripcion'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  decoration: completada ? TextDecoration.lineThrough : TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          completada ? Icons.check_circle : Icons.radio_button_unchecked,
                          color: completada ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton.icon(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AllTasksPage()),
              );
              setState(() {}); // Para actualizar si hay cambios
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
