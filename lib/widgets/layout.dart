import 'package:energy_tasker/pages/new_task_form_section.dart';
import 'package:energy_tasker/pages/progress_section.dart';
import 'package:energy_tasker/pages/home_section.dart';
import 'package:energy_tasker/data/tasks_categories.dart';
import 'package:flutter/material.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key});

  @override
  _LayoutWidgetState createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  // Índice de la pantalla seleccionada
  int _selectedIndex = 0;

  // Cambiar el índice seleccionado al tocar un ítem en el BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lista de pantallas que se alternan en función de _selectedIndex
    final List<Widget> _screens = [
      HomeScreen(),
      ProgressPage(), // Página de progreso
      NewTaskFormPage(
        onTareaCreada: (tarea, categoria) {
          // Añadir la nueva tarea a la categoría correspondiente
          final categoryData = categoryTasks.firstWhere(
              (cat) => cat['category'] == categoria);

          final List<Map<String, dynamic>> tareas = categoryData['tasks'];
          tareas.add(tarea); // Añadir la tarea
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Fondo blanco
      appBar: MyAppBar(), // Barra superior personalizada
      body: _screens[_selectedIndex], // Cambia el cuerpo según el índice seleccionado
      bottomNavigationBar: MyNavBar(
        currentIndex: _selectedIndex, // Índice actual para destacar el ítem
        onTap: _onItemTapped, // Acción al tocar un ítem
      ),
    );
  }
}

// Widget para la barra superior (AppBar)
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 118, 187, 119), // Color de fondo verde
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centrar el título
        children: [
          SizedBox(width: 10), // Espaciado entre el borde y el título
          Text(
            "Energy Tasker", // Título de la app
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

  // Definir el tamaño preferido de la AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Widget para la barra de navegación inferior (BottomNavigationBar)
class MyNavBar extends StatelessWidget {
  final int currentIndex; // Índice de la pestaña seleccionada
  final Function(int) onTap; // Función que se llama al tocar un ítem

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
          // Sombra debajo de la barra de navegación
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 4,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex, // Índice actual
        backgroundColor: Color.fromARGB(255, 118, 187, 119), // Color de fondo verde
        onTap: onTap, // Función que se ejecuta al seleccionar un ítem
        selectedItemColor: Colors.brown, // Color de ítem seleccionado
        unselectedItemColor: Color.fromARGB(255, 15, 74, 13), // Color de ítem no seleccionado
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35), 
            label: "Inicio", // Etiqueta para la pestaña de inicio
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph, size: 35), 
            label: "Progreso", // Etiqueta para la pestaña de progreso
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 35), 
            label: "Nueva tarea", // Etiqueta para la pestaña de nueva tarea
          ),
        ],
      ),
    );
  }
}
