import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/maintenance_viewmodel.dart';
import 'views/screens/login_screen.dart';
import 'views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider nos permite registrar todos los ViewModels
    // que la app necesita en un solo lugar.
    // Estarán disponibles en todo el árbol de widgets.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => MaintenanceViewModel()),
      ],
      child: MaterialApp(
        title: 'Gestor de Coche',
        theme: ThemeData(
          // Usamos un tema oscuro para un look moderno
          brightness: Brightness.dark,
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: const Color(0xFF1A1A2E),
          cardColor: const Color(0xFF16213E),
          // Definimos la fuente principal con Google Fonts
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          colorScheme: const ColorScheme.dark(
            primary: Colors.blueAccent,
            secondary: Color(0xFF0F3460),
            surface: Color(0xFF1A1A2E),
          ),
        ),
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, _) {
            // El widget Consumer "escucha" los cambios en AuthViewModel.
            // Si el usuario está autenticado, mostramos HomeScreen.
            // Si no, mostramos LoginScreen.
            return authViewModel.isAuthenticated
                ? const HomeScreen()
                : const LoginScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
