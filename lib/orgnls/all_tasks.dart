import 'package:flutter/material.dart';

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({super.key});

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  List<bool> completadas = List.filled(10, false);

  final List<Map<String, dynamic>> tareas = [
    {
      'categoria': 'Alta energía',
      'color': Colors.green,
      'tareas': [
        {
          'titulo': 'Hacer ejercicio',
          'descripcion': '30 minutos de cardio o pesas.',
          'repeticion': 1,
        },
        {
          'titulo': 'Limpiar tu cuarto',
          'descripcion': 'Rápido, como reto de 15 minutos.',
        },
        {
          'titulo': 'Escribir en tu diario',
          'descripcion': 'Exprésate y organiza tus ideas.',
          'repeticion': 1,
        },
      ],
    },
    {
      'categoria': 'Energía media',
      'color': Colors.blueGrey,
      'tareas': [
        {
          'titulo': 'Leer un capítulo de un libro',
          'descripcion': 'Algo tranquilo y que te guste.',
        },
        {
          'titulo': 'Ordenar tu escritorio',
          'descripcion': 'Solo lo básico, que se vea decente.',
          'repeticion': 1,
        },
        {
          'titulo': 'Ver un video educativo',
          'descripcion': 'Algo que te interese o motive.',
        },
      ],
    },
    {
      'categoria': 'Baja energía',
      'color': Colors.pink,
      'tareas': [
        {
          'titulo': 'Tomar agua',
          'descripcion': 'Un vaso para refrescarte.',
        },
        {
          'titulo': 'Respirar profundo',
          'descripcion': '3 minutos de respiración lenta.',
        },
        {
          'titulo': 'Escuchar música tranquila',
          'descripcion': 'Tu playlist relajante favorita.',
          'repeticion': 1,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    int indexGlobal = 0;

    return MaterialApp(
      title: 'Todas las Tareas',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Todas las Tareas'),
          backgroundColor: Colors.blueGrey[200],
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...tareas.map((grupo) {
                List<Widget> seccion = [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Text(
                        grupo['categoria'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: grupo['color'],
                        ),
                      ),
                    ],
                  ),
                ];

                for (var tarea in grupo['tareas']) {
                  int currentIndex = indexGlobal;

                  seccion.add(
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          completadas[currentIndex] =
                              !completadas[currentIndex];
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
                          color: grupo['color'].withOpacity(0.05),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: grupo['color'].withOpacity(0.1),
                              child: Icon(
                                tarea['icono'],
                                color: grupo['color'],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tarea['titulo'],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      decoration: completadas[currentIndex]
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    tarea['descripcion'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              completadas[currentIndex]
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: completadas[currentIndex]
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );

                  indexGlobal++;
                }

                return Column(children: seccion);
              }).toList(),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton.icon(
                  onPressed: () {/*
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AllTasksPage()),//Cambiar a la ruta para que sea al progreso
                    );*/
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[200],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 30,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ), 
                  icon: const Icon(Icons.auto_graph_rounded, color: Colors.white),
                  label: const Text(
                    'Ver tu progreso',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}