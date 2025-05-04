import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Map<String, dynamic> tarea;
  final bool completada;
  final VoidCallback onTap;
  final List<Color> colores;

  const TaskCard({
    super.key,
    required this.tarea,
    required this.completada,
    required this.onTap,
    required this.colores,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: colores),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(2, 4),
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
                      decoration: completada
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    tarea['descripcion'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      decoration: completada
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
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
  }
}
