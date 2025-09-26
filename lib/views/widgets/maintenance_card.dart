import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/maintenance.dart';
import 'package:intl/intl.dart';


class MaintenanceCard extends StatelessWidget {
  final Maintenance maintenance;

  const MaintenanceCard({super.key, required this.maintenance});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM, yyyy').format(maintenance.dueDate);
    final formattedCost = NumberFormat.currency(locale: 'es_MX', symbol: '\$').format(maintenance.cost);

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: const Color(0xFF16213E).withOpacity(0.8),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              maintenance.title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              maintenance.description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.blueAccent),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blueAccent, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      formattedDate,
                      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  formattedCost,
                  style: GoogleFonts.poppins(
                    color: Colors.greenAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
