import 'package:energy_tasker/Pages/new_task_form_page.dart';
import 'package:energy_tasker/Pages/progress_page.dart';
import 'package:energy_tasker/pages/home_screen.dart';
import 'package:energy_tasker/data/tasks_categories.dart';
import 'package:flutter/material.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key});

  @override
  _LayoutWidgetState createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 👇 Esto se reconstruye con cada cambio de _selectedIndex
    final List<Widget> _screens = [
      HomeScreen(),
      ProgressPage(), // <- Siempre nueva instancia
      NewTaskFormPage(
        onTareaCreada: (tarea, categoria) {
          final categoriaData = categoriTasks.firstWhere(
              (cat) => cat['categoria'] == categoria);

          final List<Map<String, dynamic>> tareas = categoriaData['tareas'];
          tareas.add(tarea);
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: MyAppBar(),
      body: _screens[_selectedIndex], // 👈 Alternativa simple a IndexedStack
      bottomNavigationBar: MyNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Widget para la barra superior
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 118, 187, 119),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Text(
            "Energy Tasker",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Widget para la barra de navegación inferior
class MyNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 4,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color.fromARGB(255, 118, 187, 119),
        onTap: onTap,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Color.fromARGB(255, 15, 74, 13),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 35), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_graph, size: 35), label: "Progreso"),
          BottomNavigationBarItem(icon: Icon(Icons.add, size: 35), label: "Nueva tarea"),
        ],
      ),
    );
  }
}
