import 'package:flutter/material.dart';
import 'package:energy_tasker/pages/all_tasks.dart';
import 'package:energy_tasker/data/data_tasks.dart';

class MidEnergyPage extends StatefulWidget {
  const MidEnergyPage({super.key});

  @override
  State<MidEnergyPage> createState() => _MidEnergyPageState();
}

class _MidEnergyPageState extends State<MidEnergyPage> {
  List<bool> completadas = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energía Media',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Tareas - Energía Media'),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.sentiment_neutral,
              size: 80,
              color: Colors.blueGrey,
            ),
            const Text(
              'Día regular, tareas ligeras',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            for (int i = 0; i < tareasMid.length; i++)
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
                    color: Colors.blue[50],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tareasMid[i]['titulo'],
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                decoration:
                                    completadas[i]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              tareasMid[i]['descripcion'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                  backgroundColor: Colors.blueGrey,
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
