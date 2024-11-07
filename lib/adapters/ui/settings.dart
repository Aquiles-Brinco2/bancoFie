import 'package:flutter/material.dart';

class SettingsScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'CONFIGURACIONES',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/configuracion_icono.png', // Asegúrate de tener esta imagen
              width: 80,
              height: 80,
            ),
            SizedBox(height: 20),
            // Lista de opciones de configuración
            settingsOption('Cambio de Contraseña'),
            Divider(),
            settingsOption('Cambio de Preguntas de Seguridad'),
            Divider(),
            settingsOption('Cambio de Imagen de Seguridad'),
            Divider(),
            settingsOption('Dispositivos'),
            Divider(),
            settingsOption('Autenticación Biométrica'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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

  // Widget para las opciones de configuración
  Widget settingsOption(String title) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      leading: Icon(Icons.security,
          color: Colors.pinkAccent), // Cambia el icono según cada opción
      title: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
      onTap: () {},
    );
  }
}
