import 'package:flutter/material.dart';
import 'max_energy_tasks.dart';
import 'mid_energy_tasks.dart';
import 'min_energy_tasks.dart';

final List<Map<String, dynamic>> categoriTasks = [
  {
    'categoria': 'Alta energía',
    'color': Color.fromARGB(255, 0, 150, 135),
    'colorCard': Color.fromARGB(255, 178, 251, 244),
    'tareas': tareasMax,
  },
  {
    'categoria': 'Energía media',
    'color': Color.fromARGB(255, 68, 138, 255),
    'colorCard': Color.fromARGB(255, 187, 222, 251),
    'tareas': tareasMid,
  },
  {
    'categoria': 'Baja energía',
    'color': Color.fromARGB(255, 233, 30, 99),
    'colorCard': Color.fromARGB(255, 252, 228, 236),
    'tareas': tareasMin,
  },
];
