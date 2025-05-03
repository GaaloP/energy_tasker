import 'package:flutter/material.dart';
import 'package:energy_tasker/pages/all_tasks.dart';

class MaxEnergyPage extends StatefulWidget {
  const MaxEnergyPage({super.key});

  @override
  State<MaxEnergyPage> createState() => _MaxEnergyPageState();
}

class _MaxEnergyPageState extends State<MaxEnergyPage> {
  List<bool> completadas = [false, false, false];

  final List<Map<String, dynamic>> tareas = [
    {
      'titulo': 'Estudiar Flutter',
      'descripcion': 'Avanzar en el curso y practicar widgets.',
      'icono': Icons.code,
      'color': Colors.indigo,
    },
    {
      'titulo': 'Hacer ejercicio',
      'descripcion': '30 minutos de cardio + estiramientos.',
      'icono': Icons.fitness_center,
      'color': Colors.redAccent,
    },
    {
      'titulo': 'Leer un libro',
      'descripcion': 'Leer 10 páginas del libro de desarrollo personal.',
      'icono': Icons.menu_book,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energía Alta',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Tareas - Energía Alta'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.sentiment_very_satisfied,
              size: 80,
              color: Colors.teal,
            ),
            const Text(
              '¡Hoy estás con toda la energía!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < tareas.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    completadas[i] = !completadas[i];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors:
                          completadas[i]
                              ? [Colors.green[200]!, Colors.green[50]!]
                              : [Colors.white, Colors.grey[100]!],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: tareas[i]['color'].withOpacity(0.1),
                        child: Icon(
                          tareas[i]['icono'],
                          color: tareas[i]['color'],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tareas[i]['titulo'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration:
                                    completadas[i]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              tareas[i]['descripcion'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                                decoration:
                                    completadas[i]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        completadas[i]
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: completadas[i] ? Colors.green : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AllTasksPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.arrow_forward,color: Color.fromRGBO(255, 255, 255, 1),),
                label: const Text(
                  'Ver tus tareas',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
