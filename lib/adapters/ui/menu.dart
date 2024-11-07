import 'package:banco_fie/adapters/ui/compras_internet.dart';
import 'package:banco_fie/adapters/ui/extracto.dart';
import 'package:banco_fie/adapters/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importar si usas ComprasInternetScreen

class MenuScreenApp extends StatelessWidget {
  const MenuScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'MÁS',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.notifications, color: Colors.pinkAccent),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new, color: Colors.blue),
            onPressed: () {
              // Reemplaza esto con la función de tu botón
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Fila 1: Usuario y Administración de Tarjeta de Débito
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuButton('Usuario', 'assets/usuario.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                }),
                menuButton(
                    'Administración de Tarjeta de Débito', 'assets/tarjeta.png',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComprasInternetScreen(),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 2: Giros y Transferencias al Exterior
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuButton('Giros', 'assets/giros.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExtractoScreen(),
                    ),
                  );
                }),
                menuButton('Transferencias al Exterior',
                    'assets/transferencias.png', () {}),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 3: Ayuda
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuButton('Ayuda', 'assets/ayuda.png', () {}),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sync_alt), label: 'Transferencias'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Pagos QR'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pagos'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Más'),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Widget para los botones de menú con restricciones de tamaño de imagen y acción de toque
  Widget menuButton(String title, String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  assetPath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
