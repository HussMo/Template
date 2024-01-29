// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:theme_app/Shared/widgets/bottom_navigation_bar.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<QRScannerScreen> {
  var qrstr = "Start Scanning";
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    var currentIndex = 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: scanQr, 
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  qrstr,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                Container(
                  width: width * 0.6,
                  height: width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      size: 60,
                      color: Colors.black, 
                    ),
                    onPressed: scanQr,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: currentIndex),
    );
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
        '#2A99CF',
        'Cancel',
        true,
        ScanMode.QR,
      );
    } catch (e) {
      setState(() {
        qrstr = 'Unable to read this';
      });
    }
  }
}
