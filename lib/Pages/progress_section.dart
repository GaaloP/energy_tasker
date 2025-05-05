import 'package:flutter/material.dart';
import 'package:energy_tasker/data/tasks_categories.dart';

// Página que muestra el progreso basado en las tareas completadas
class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  // Porcentaje de progreso que se muestra en la interfaz
  int _porcentaje = 0;

  // Ruta de la imagen que representa el progreso
  String _rutaImagen = 'assets/tree_progress_0.png';

  // Función para calcular el progreso y actualizar la imagen correspondiente
  void _calcularProgreso() {
    // Obtener todas las tareas de todas las categorías
    final totalTareas = categoryTasks.expand((cat) => cat['tasks']).toList();

    // Contar cuántas tareas están completadas
    final totalCompletadas = totalTareas.where((t) => t['completada'] == true).length;

    // Calcular el porcentaje de tareas completadas
    final nuevoPorcentaje = totalTareas.isEmpty
        ? 0
        : ((totalCompletadas / totalTareas.length) * 100).round();

    // Determinar la imagen a mostrar dependiendo del progreso
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

    // Actualizar el estado para reflejar el nuevo porcentaje y la nueva imagen
    setState(() {
      _porcentaje = nuevoPorcentaje;
      _rutaImagen = nuevaImagen;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _calcularProgreso(); // Se llama cuando el widget reaparece
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Título que muestra el texto "Tu progreso"
          Text(
            'Tu progreso',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Imagen que representa el árbol y su progreso
          Image.asset(
            _rutaImagen,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          // Texto que muestra el porcentaje de progreso completado
          Text(
            '$_porcentaje% completado',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
