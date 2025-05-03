import 'package:flutter/material.dart';
import 'package:energy_tasker/pages/all_tasks.dart';
import 'package:energy_tasker/data/data_tasks.dart';

class MinEnergyPage extends StatefulWidget {
  const MinEnergyPage({super.key});

  @override
  State<MinEnergyPage> createState() => _MinEnergyPageState();
}

class _MinEnergyPageState extends State<MinEnergyPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energía Baja',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Tareas - Energía Baja'),
          backgroundColor: Colors.pink[200],
          foregroundColor: Colors.black,
        ), 
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.sentiment_very_dissatisfied,
              size: 80,
              color: Colors.pink,
            ),
            const Text(
              'No pasa nada, ve poco a poco',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < tareasMin.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    tareasMin[i]['completada'] = ! (tareasMin[i]['completada'] ?? false);
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
                      colors: (tareasMin[i]['completada'] ?? false)
                          ? [Color.fromARGB(255, 180, 255, 183), Color.fromARGB(255, 239, 247, 240)]
                          : [Color.fromARGB(255, 252, 228, 236), Color.fromARGB(255, 252, 228, 236)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
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
                              tareasMin[i]['titulo'],
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                decoration:(tareasMin[i]['completada'] ?? false)
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              tareasMin[i]['descripcion'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                                decoration: (tareasMin[i]['completada'] ?? false)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        (tareasMin[i]['completada'] ?? false)
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: (tareasMin[i]['completada'] ?? false)
                          ?  Colors.green
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
                  backgroundColor: Colors.pink[200],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.arrow_forward),
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
