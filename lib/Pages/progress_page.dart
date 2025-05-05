import 'package:flutter/material.dart';
import 'package:energy_tasker/data/tasks_categories.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int porcentaje = 0;
  String rutaImagen = 'assets/tree_progress_0.png';

  void calcularProgreso() {
    final totalTareas = categoriTasks.expand((cat) => cat['tareas']).toList();
    final totalCompletadas = totalTareas.where((t) => t['completada'] == true).length;

    final nuevoPorcentaje = totalTareas.isEmpty
        ? 0
        : ((totalCompletadas / totalTareas.length) * 100).round();

    String nuevaImagen;
    if (nuevoPorcentaje <= 20) {
      nuevaImagen = 'assets/tree_progress_0.png';
    } else if (nuevoPorcentaje <= 40) {
      nuevaImagen = 'assets/tree_progress_1.png';
    } else if (nuevoPorcentaje <= 60) {
      nuevaImagen = 'assets/tree_progress_2.png';
    } else if (nuevoPorcentaje <= 80) {
      nuevaImagen = 'assets/tree_progress_3.png';
    } else {
      nuevaImagen = 'assets/tree_progress_4.png';
    }

    setState(() {
      porcentaje = nuevoPorcentaje;
      rutaImagen = nuevaImagen;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    calcularProgreso(); // Se llama cuando el widget reaparece
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Tu progreso', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Image.asset(
            rutaImagen,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            '$porcentaje% completado',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
