import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  // Variables de clase
  final Map<String, dynamic> tarea; // Información de la tarea
  final bool completada; // Indica si la tarea está completada
  final VoidCallback onTap; // Función que se llama al hacer tap
  final List<Color> colores; // Colores para el gradiente de fondo

  const TaskCard({
    super.key,
    required this.tarea, // Se requiere información de la tarea
    required this.completada, // Se requiere estado de la tarea
    required this.onTap, // Se requiere función de tap
    required this.colores, // Se requieren los colores para el fondo
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Ejecuta la función cuando se toca la tarjeta
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Márgenes de la tarjeta
        padding: EdgeInsets.all(16), // Relleno interno
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
          gradient: LinearGradient(colors: colores), // Gradiente de fondo con los colores pasados
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Sombra gris con opacidad
              blurRadius: 5, // Desenfoque de la sombra
              offset: Offset(2, 4), // Desplazamiento de la sombra
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineación de los elementos en la fila
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alineación de los elementos en la columna
                children: [
                  // Título de la tarea
                  Text(
                    tarea['titulo'], // Obtiene el título de la tarea
                    style: TextStyle(
                      fontSize: 17, // Tamaño de fuente
                      fontWeight: FontWeight.bold, // Peso de la fuente en negrita
                      decoration: completada
                          ? TextDecoration.lineThrough // Si la tarea está completada, agrega una línea a través del texto
                          : TextDecoration.none, // Si no está completada, no tiene ninguna decoración
                    ),
                  ),
                  SizedBox(height: 5), // Espaciado entre título y descripción
                  // Descripción de la tarea
                  Text(
                    tarea['descripcion'], // Obtiene la descripción de la tarea
                    style: TextStyle(
                      fontSize: 14, // Tamaño de fuente
                      color: Colors.grey[700], // Color gris oscuro para el texto
                      decoration: completada
                          ? TextDecoration.lineThrough // Línea a través si está completada
                          : TextDecoration.none, // Si no está completada, sin línea
                    ),
                  ),
                ],
              ),
            ),
            // Icono de estado de la tarea: un check si está completada, un círculo vacío si no lo está
            Icon(
              completada ? Icons.check_circle : Icons.radio_button_unchecked,
              color: completada ? Colors.green : Colors.grey, // Color verde si está completada, gris si no
            ),
          ],
        ),
      ),
    );
  }
}
