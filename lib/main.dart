import 'package:energy_tasker/pages/all_tasks.dart';
import 'package:energy_tasker/pages/max_energy_page.dart';
import 'package:energy_tasker/pages/min_energy_page.dart';
import 'package:energy_tasker/pages/mid_energy_page.dart';
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
        '/max': (BuildContext context) => MaxEnergyPage(),
        '/mid': (BuildContext context) => MidEnergyPage(),
        '/min': (BuildContext context) => MinEnergyPage(), 
        '/all_tasks': (BuildContext context) => AllTasksPage(),
      },

    );
  }
}