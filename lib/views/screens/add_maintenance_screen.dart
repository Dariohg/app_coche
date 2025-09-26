import 'package:app_coche/models/maintenance.dart';
import 'package:app_coche/viewmodels/maintenance_viewmodel.dart';
import 'package:app_coche/views/widgets/custom_date_picker_field.dart';
import 'package:app_coche/views/widgets/custom_elevated_button.dart';
import 'package:app_coche/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMaintenanceScreen extends StatefulWidget {
  const AddMaintenanceScreen({super.key});

  @override
  State<AddMaintenanceScreen> createState() => _AddMaintenanceScreenState();
}

class _AddMaintenanceScreenState extends State<AddMaintenanceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _saveMaintenance() {
    if (_formKey.currentState!.validate()) {
      final newMaintenance = Maintenance(
        title: _titleController.text,
        description: _descriptionController.text,
        dueDate: _selectedDate,
        cost: double.tryParse(_costController.text) ?? 0.0,
      );

      // Usamos el ViewModel para añadir el mantenimiento
      Provider.of<MaintenanceViewModel>(context, listen: false).addMaintenance(newMaintenance);

      // Regresamos a la pantalla anterior
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: Text(
          'Añadir Mantenimiento',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                controller: _titleController,
                labelText: 'Título',
                hintText: 'Ej. Cambio de Aceite',
                icon: Icons.title,
                validator: (value) => value!.isEmpty ? 'El título es obligatorio' : null,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _descriptionController,
                labelText: 'Descripción',
                hintText: 'Detalles del servicio realizado...',
                icon: Icons.description,
                maxLines: 3,
                validator: (value) => value!.isEmpty ? 'La descripción es obligatoria' : null,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _costController,
                labelText: 'Costo',
                hintText: 'Ej. 850.50',
                icon: Icons.attach_money,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) return 'El costo es obligatorio';
                  if (double.tryParse(value) == null) return 'Introduce un número válido';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomDatePickerField(
                labelText: 'Fecha de Realización',
                selectedDate: _selectedDate,
                onDateSelected: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: 'Guardar Mantenimiento',
                onPressed: _saveMaintenance,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

