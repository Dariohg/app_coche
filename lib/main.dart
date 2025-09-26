import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/maintenance_viewmodel.dart';
import 'views/screens/login_screen.dart';
import 'views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_MX', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => MaintenanceViewModel()),
      ],
      child: MaterialApp(
        title: 'Gestor de Coche',
        theme: ThemeData(
          // Nueva paleta de colores y tema mejorado
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF5A6BF8),
          scaffoldBackgroundColor: const Color(0xFF0F172A), // Fondo base oscuro
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF5A6BF8),
            secondary: Color(0xFF3D5AFE),
            surface: Color(0xFF1E293B),
            background: Color(0xFF0F172A),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFF1E293B),
          ),
        ),
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, _) {
            return authViewModel.isAuthenticated ? const HomeScreen() : const LoginScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

