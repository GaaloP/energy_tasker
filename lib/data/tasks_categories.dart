import 'package:flutter/material.dart';
import 'max_energy_tasks.dart';
import 'mid_energy_tasks.dart';
import 'min_energy_tasks.dart';

final List<Map<String, dynamic>> categoryTasks = [
  {
    'category': 'Alta energía',
    'color': Color.fromARGB(255, 0, 150, 135),
    'taskCardColor': Color.fromARGB(255, 178, 251, 244),
    'tasks': tareasMax,
  },
  {
    'category': 'Energía media',
    'color': Color.fromARGB(255, 68, 138, 255),
    'taskCardColor': Color.fromARGB(255, 187, 222, 251),
    'tasks': tareasMid,
  },
  {
    'category': 'Baja energía',
    'color': Color.fromARGB(255, 233, 30, 99),
    'taskCardColor': Color.fromARGB(255, 252, 228, 236),
    'tasks': tareasMin,
  },
];
