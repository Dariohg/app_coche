import 'package:flutter/foundation.dart';
import '../models/maintenance.dart';

class MaintenanceViewModel extends ChangeNotifier {
  // Lista privada de mantenimientos realizados (historial)
  final List<Maintenance> _maintenanceHistory = [
    Maintenance(
      title: 'Cambio de Aceite',
      description: 'Aceite sintético 5W-30 y filtro nuevo.',
      dueDate: DateTime(2024, 7, 15), // Corregido: date -> dueDate
      cost: 850.50,
    ),
    Maintenance(
      title: 'Rotación de Llantas',
      description: 'Rotación y balanceo de las 4 llantas.',
      dueDate: DateTime(2024, 6, 20), // Corregido: date -> dueDate
      cost: 400.00,
    ),
    Maintenance(
      title: 'Frenos Delanteros',
      description: 'Cambio de balatas delanteras.',
      dueDate: DateTime(2024, 5, 10), // Corregido: date -> dueDate
      cost: 1200.00,
    ),
  ];

  // Getter público para acceder al historial
  List<Maintenance> get maintenanceHistory => _maintenanceHistory;

  // Método para añadir un nuevo mantenimiento al historial
  void addMaintenance(Maintenance newMaintenance) {
    _maintenanceHistory.insert(0, newMaintenance); // Añade al inicio de la lista
    notifyListeners(); // Notifica a los widgets que escuchan para que se redibujen
  }
}

