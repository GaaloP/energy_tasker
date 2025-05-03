import 'package:flutter/material.dart';
import 'max_energy_tasks.dart';
import 'mid_energy_tasks.dart';
import 'min_energy_tasks.dart';

final List<Map<String, dynamic>> categoriasTareas = [
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
