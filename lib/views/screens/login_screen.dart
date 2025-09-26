import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      body: Container(
        // Fondo con gradiente para un look más atractivo
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).colorScheme.background, const Color(0xFF1E293B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.directions_car_rounded,
                      size: 80,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Bienvenido',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Inicia sesión para continuar',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 40),
                    CustomTextFormField(
                      controller: _usernameController,
                      labelText: 'Usuario',
                      icon: Icons.person_outline,
                      validator: (value) => value!.isEmpty ? 'Por favor, introduce tu usuario' : null,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'Contraseña',
                      icon: Icons.lock_outline,
                      obscureText: true,
                      validator: (value) => value!.isEmpty ? 'Por favor, introduce tu contraseña' : null,
                    ),
                    const SizedBox(height: 40),
                    CustomElevatedButton(
                      text: 'Iniciar Sesión',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authViewModel.login(
                            _usernameController.text,
                            _passwordController.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

