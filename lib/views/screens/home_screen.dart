import 'package:app_coche/views/screens/add_maintenance_screen.dart';
import 'package:app_coche/views/widgets/maintenance_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/maintenance_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuchamos los cambios en el ViewModel
    final maintenanceViewModel = Provider.of<MaintenanceViewModel>(context);
    final history = maintenanceViewModel.maintenanceHistory;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: Text(
          'Historial de Mantenimiento',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: history.isEmpty
          ? Center(
        child: Text(
          'No hay mantenimientos registrados.',
          style: GoogleFonts.poppins(color: Colors.white54, fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final maintenance = history[index];
          return MaintenanceCard(maintenance: maintenance);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla para añadir un nuevo mantenimiento
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMaintenanceScreen()),
          );
        },
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}

