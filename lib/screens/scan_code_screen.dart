import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smart_grocery/screens/routes.dart';

class ScanCodeScreen extends StatefulWidget {
  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String? result = '';

  QRViewController? controller;
  bool showScanner = false;

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: 300,
              child: showScanner
                  ? QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Theme.of(context).primaryColor,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                    )
                  : Image.asset('assets/images/qr-code.png'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: showScanner
                      ? () {
                          showScanner = !showScanner;

                          setState(() {});
                          Navigator.of(context)
                              .pushNamed(Routes.paymentMethodRoute);
                        }
                      : () {
                          showScanner = !showScanner;
                          setState(() {});
                        },
                  child: !showScanner ? Text('SCAN') : Text('Done')),
            ),
            SizedBox(height: 50),
            Text('Scanned Data : ' + result!),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code;
      });
    });
  }
}
