import 'package:flutter/material.dart';
import 'package:energy_tasker/pages/all_tasks.dart';
import 'package:energy_tasker/data/data_tasks.dart';

class MaxEnergyPage extends StatefulWidget {
  const MaxEnergyPage({super.key});

  @override
  State<MaxEnergyPage> createState() => _MaxEnergyPageState();
}

class _MaxEnergyPageState extends State<MaxEnergyPage> {
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
            for (int i = 0; i < tareasMax.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    tareasMax[i]['completada'] = !(tareasMax[i]['completada'] ?? false);
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
                      colors: (tareasMax[i]['completada'] ?? false)
                          ? [Color.fromARGB(255, 180, 255, 183), Color.fromARGB(255, 239, 247, 240)]
                          : [Color.fromARGB(255, 178, 251, 244), Color.fromARGB(255, 178, 251, 244)],
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tareasMax[i]['titulo'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: (tareasMax[i]['completada'] ?? false)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              tareasMax[i]['descripcion'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                                decoration: (tareasMax[i]['completada'] ?? false)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        (tareasMax[i]['completada'] ?? false)
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: (tareasMax[i]['completada'] ?? false)
                            ? Colors.green
                            : Colors.grey,
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
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
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
