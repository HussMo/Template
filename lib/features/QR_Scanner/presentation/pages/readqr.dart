import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGeneratorScreen extends StatelessWidget {
final String _data = 'Order Amount: 100K\n\nStore Details: {Name: Thunder with ID: 2345}\n\nTransaction Id: 4555,';

 const QRGeneratorScreen({super.key});

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated QR Code',),
      ),
      body: Center(
        child: QrImageView(
          backgroundColor: Colors.white,
          data: _data,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
 }
}


