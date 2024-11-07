import 'package:banco_fie/adapters/ui/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BancoFieApp());
}

class BancoFieApp extends StatelessWidget {
  const BancoFieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Image.asset(
            'assets/logo.png',
            height: 100, // Puedes ajustar esta altura según sea necesario
            width: MediaQuery.of(context).size.width *
                0.6, // Ajustar el ancho según el tamaño de la pantalla
            fit: BoxFit
                .contain, // Esto asegura que la imagen se ajuste bien sin distorsionarse
          ),
          const SizedBox(height: 30),

          // Usuario
          Image.asset(
            'assets/usuario.png',
            height: 100, // Puedes ajustar esta altura según sea necesario
            width: MediaQuery.of(context).size.width *
                0.6, // Ajustar el ancho según el tamaño de la pantalla
            fit: BoxFit
                .contain, // Esto asegura que la imagen se ajuste bien sin distorsionarse
          ),
          const SizedBox(height: 30),

          // Título
          const Text(
            'INICIO DE SESIÓN',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 20),

          // Campo de usuario
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'USUARIO',
                suffixIcon: const Icon(Icons.visibility),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Botón continuar
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuScreenApp()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              backgroundColor: Colors.pinkAccent.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('CONTINUAR'),
          ),
          const SizedBox(height: 30),

          // Botón de reconocimiento facial
          Column(
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/reconocimiento_facial.png',
                  width: 80, // Ajusta el ancho de la imagen
                  height: 80, // Ajusta la altura si es necesario
                  fit: BoxFit.contain,
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('RECONOCIMIENTO FACIAL'),
              ),
            ],
          ),
          const Spacer(),

          // Botones de Ubícanos y Contáctanos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/ubicanos.png',
                        width: 50, // Ajusta el ancho de la imagen
                        height: 50, // Ajusta la altura si es necesario
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {},
                    ),
                    const Text('UBÍCANOS',
                        style: TextStyle(color: Colors.pink)),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/contactanos.png',
                        width: 50, // Ajusta el ancho de la imagen
                        height: 50, // Ajusta la altura si es necesario
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {},
                    ),
                    const Text('CONTÁCTANOS',
                        style: TextStyle(color: Colors.pink)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
