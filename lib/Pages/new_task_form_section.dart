import 'package:flutter/material.dart';

// Página para crear una nueva tarea
class NewTaskFormPage extends StatefulWidget {
  // Callback para cuando una nueva tarea es creada, pasa los datos de la tarea y la categoría seleccionada
  final void Function(Map<String, dynamic> tarea, String categoria)? onTareaCreada;

  // Constructor que recibe el callback para la tarea creada
  const NewTaskFormPage({super.key, required this.onTareaCreada});

  @override
  State<NewTaskFormPage> createState() => _NewTaskFormPageState();
}

class _NewTaskFormPageState extends State<NewTaskFormPage> {
  // Clave para el formulario que permite validarlo
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();

  // Variable para almacenar la categoría seleccionada
  String _categoriaSeleccionada = 'Alta energía';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        // Asegura que el contenido no se sobreponga cuando el teclado está visible
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la pantalla
          const Text("Nueva Tarea", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Form(
            key: _formKey, // Asociamos la clave del formulario
            child: Column(
              children: [
                // Campo para el título de la tarea
                TextFormField(
                  controller: _tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                  // Validación del título, debe ser no vacío
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Escribe un título' : null,
                ),
                const SizedBox(height: 10),
                // Campo para la descripción de la tarea
                TextFormField(
                  controller: _descripcionController,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  // Validación de la descripción, debe ser no vacía
                  validator: (value) => value == null || value.isEmpty
                      ? 'Escribe una descripción'
                      : null,
                ),
                const SizedBox(height: 10),
                // Dropdown para seleccionar la categoría de la tarea
                DropdownButtonFormField<String>(
                  value: _categoriaSeleccionada,
                  decoration: const InputDecoration(labelText: 'Categoría'),
                  items: const [
                    DropdownMenuItem(value: 'Alta energía', child: Text('Alta energía')),
                    DropdownMenuItem(value: 'Energía media', child: Text('Energía media')),
                    DropdownMenuItem(value: 'Baja energía', child: Text('Baja energía')),
                  ],
                  onChanged: (value) {
                    // Actualiza la categoría seleccionada cuando el usuario cambia el valor
                    if (value != null) {
                      setState(() {
                        _categoriaSeleccionada = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                // Botón para añadir la nueva tarea
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Añadir"),
                  onPressed: () {
                    // Validamos el formulario antes de añadir la tarea
                    if (_formKey.currentState!.validate()) {
                      final nuevaTarea = {
                        'titulo': _tituloController.text,
                        'descripcion': _descripcionController.text,
                        'completada': false, // Inicializamos la tarea como no completada
                      };

                      // Si el callback de tarea creada está disponible, lo llamamos
                      if (widget.onTareaCreada != null) {
                        widget.onTareaCreada!(nuevaTarea, _categoriaSeleccionada);
                      }

                      // Limpiamos los campos del formulario y restablecemos la categoría seleccionada
                      _tituloController.clear();
                      _descripcionController.clear();
                      setState(() {
                        _categoriaSeleccionada = 'Alta energía'; // Reseteamos la categoría a 'Alta energía'
                      });

                      // Mostramos un mensaje indicando que la tarea fue añadida exitosamente
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tarea añadida exitosamente')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
