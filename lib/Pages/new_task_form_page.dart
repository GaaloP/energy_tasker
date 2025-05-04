import 'package:flutter/material.dart';

class NewTaskFormPage extends StatefulWidget {
  final void Function(Map<String, dynamic> tarea, String categoria) onTareaCreada;

  const NewTaskFormPage({super.key, required this.onTareaCreada});

  @override
  _NewTaskFormPageState createState() => _NewTaskFormPageState();
}

class _NewTaskFormPageState extends State<NewTaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();
  final FocusNode _tituloFocusNode = FocusNode(); // FocusNode para el título
  String _categoriaSeleccionada = 'Alta energía';

  @override
  void dispose() {
    _tituloFocusNode.dispose();  // Asegúrate de liberar el FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nueva Tarea",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _tituloController,
                focusNode: _tituloFocusNode, // Asocia el FocusNode al TextFormField
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) => (value) ==  null || value.isEmpty 
                    ? 'Escribe un título' 
                    : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Escribe una descripción'
                    : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _categoriaSeleccionada,
                decoration: const InputDecoration(labelText: 'Categoría'),
                items: const [
                  DropdownMenuItem(value: 'Alta energía', child: Text('Alta energía')),
                  DropdownMenuItem(value: 'Energía media', child: Text('Energía media')),
                  DropdownMenuItem(value: 'Baja energía', child: Text('Baja energía')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _categoriaSeleccionada = value;
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Añadir"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nuevaTarea = {
                      'titulo': _tituloController.text,
                      'descripcion': _descripcionController.text,
                      'completada': false,
                    };
                    widget.onTareaCreada(nuevaTarea, _categoriaSeleccionada);
                  }
                  // Limpia el formulario y muestra mensaje
                  _tituloController.clear();
                  _descripcionController.clear();
                  setState(() {
                    _categoriaSeleccionada = 'Alta energía';
                  });
  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tarea añadida exitosamente')),
                  );
                }
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
