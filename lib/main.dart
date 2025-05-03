import 'package:energy_tasker/pages/all_tasks.dart';
import 'package:energy_tasker/pages/max_energy_screen.dart';
import 'package:energy_tasker/pages/min_energy_screen.dart';
import 'package:energy_tasker/widgets/layout.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Energy Tasker",
      home: const LayoutWidget(),
      routes: {
        '/max': (context) => MaxEnergyPage(),
        '/mid': (context) => MinEnergyPage(),
        '/min': (context) => MinEnergyPage(), 
        '/all_tasks': (context) => AllTasksPage(),
      },

    );
  }
}