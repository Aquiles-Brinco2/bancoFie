import 'package:flutter/material.dart';

class ExtractoScreen extends StatelessWidget {
  const ExtractoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ÚLTIMOS MOVIMIENTOS',
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
            onPressed: () {
              // Acción al presionar
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          color: Colors.pink,
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(
                          'CAJA DE AHORRO 01',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '40-0-0068165-4',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Saldo Contable',
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bs 29,186.78',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Saldo Disponible',
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bs 29,186.78',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Bs +32,418.50',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    Text(
                      'ABONOS',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Bs -22,182.00',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    Text(
                      'DÉBITOS',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('CONSULTA DE MOVIMIENTOS'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  movimientoItem(
                      'N/D: ACH TRANSFERENCIA A OTROS BANCOS POR QR (Pago excel)',
                      '12/12/2022 18:59:14',
                      '-280.00',
                      false),
                  movimientoItem(
                      'N/D: RETIRO AHORROS CAJERO AUTOMATICO (434571-XXXXXX-0354)',
                      '10/12/2022 16:20:32',
                      '-2,500.00',
                      false),
                  movimientoItem(
                      'N/D: RETIRO AHORROS CAJERO AUTOMATICO (434571-XXXXXX-0354)',
                      '10/12/2022 16:19:43',
                      '-2,500.00',
                      false),
                  movimientoItem(
                      'N/D: ACH TRANSFERENCIA ENVIADA A OTROS BANCOS DESDE IB (Transferencia ACH)',
                      '10/12/2022 09:19:02',
                      '-3,000.00',
                      false),
                  movimientoItem(
                      'N/D: ACH TRANSFERENCIA ENVIADA A OTROS BANCOS DESDE IB (Transferencia ACH)',
                      '10/12/2022 09:17:31',
                      '-3,113.00',
                      false),
                  movimientoItem(
                      'N/C: ACH TRANSFERENCIA RECIBIDA DE OTROS BANCOS (40000681654-BM AGUINALDO)',
                      '09/12/2022 19:25:17',
                      '+8,100.00',
                      true),
                  movimientoItem(
                      'N/D: TRANSFERENCIA ENVIADA A TERCEROS (QR – pago postre)',
                      '09/12/2022 16:10:00',
                      '-50.00',
                      false),
                ],
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

  Widget movimientoItem(
      String descripcion, String fecha, String monto, bool esAbono) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                esAbono ? Icons.circle : Icons.circle_outlined,
                color: esAbono ? Colors.green : Colors.red,
                size: 10,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  descripcion,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Text(
                monto,
                style: TextStyle(
                  color: esAbono ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            fecha,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }
}
