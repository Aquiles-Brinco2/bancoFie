import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComprasInternetScreen extends StatefulWidget {
  @override
  _ComprasInternetScreenState createState() => _ComprasInternetScreenState();
}

class _ComprasInternetScreenState extends State<ComprasInternetScreen> {
  bool habilitarCompras = false;
  DateTime? fechaInicial;
  DateTime? fechaFinal;

  Future<void> _seleccionarFecha(
      BuildContext context, bool esFechaInicial) async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (fechaSeleccionada != null) {
      setState(() {
        if (esFechaInicial) {
          fechaInicial = fechaSeleccionada;
        } else {
          fechaFinal = fechaSeleccionada;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'COMPRAS POR INTERNET',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TARJETA DE DÉBITO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.pink),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                '434571-XXXXXX-0354',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'HABILITAR COMPRAS POR INTERNET',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.pink),
                ),
                Switch(
                  value: habilitarCompras,
                  onChanged: (bool value) {
                    setState(() {
                      habilitarCompras = value;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'ESTABLECE LA DURACIÓN',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.pink),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () => _seleccionarFecha(context, true),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fecha Inicial',
                    labelStyle: TextStyle(color: Colors.blue),
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                  controller: TextEditingController(
                    text: fechaInicial != null
                        ? DateFormat('dd/MM/yyyy').format(fechaInicial!)
                        : '',
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => _seleccionarFecha(context, false),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fecha Final',
                    labelStyle: TextStyle(color: Colors.blue),
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                  controller: TextEditingController(
                    text: fechaFinal != null
                        ? DateFormat('dd/MM/yyyy').format(fechaFinal!)
                        : '',
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: habilitarCompras ? () {} : null,
                child: Text('CONTINUAR'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: habilitarCompras ? Colors.blue : Colors.grey,
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: 'Transferencias'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Pagos QR'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pagos'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Más'),
        ],
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
