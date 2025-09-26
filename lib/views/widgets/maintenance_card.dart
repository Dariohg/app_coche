import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/maintenance.dart';

class MaintenanceCard extends StatelessWidget {
  final Maintenance maintenance;

  const MaintenanceCard({super.key, required this.maintenance});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM, yyyy', 'es_MX').format(maintenance.dueDate);
    final formattedCost = NumberFormat.currency(locale: 'es_MX', symbol: '\$').format(maintenance.cost);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.surface.withOpacity(0.8),
            Theme.of(context).colorScheme.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 6,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maintenance.title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        maintenance.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(color: Colors.white70, height: 1.5),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoChip(
                            context,
                            icon: Icons.calendar_today_outlined,
                            text: formattedDate,
                          ),
                          _buildInfoChip(
                            context,
                            icon: Icons.attach_money_rounded,
                            text: formattedCost,
                            color: Colors.green.shade300,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, {required IconData icon, required String text, Color? color}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color ?? Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: color ?? Colors.white,
          ),
        ),
      ],
    );
  }
}

