import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smart_grocery/constants/data_provider.dart';
import 'package:smart_grocery/screens/routes.dart';
import 'package:badges/badges.dart';
import 'package:smart_grocery/services/authentication_helper.dart';

class ScanCodeScreen extends StatefulWidget {
  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String? result = '';
  int counter = 0;
  QRViewController? controller;
  bool showScanner = false;
  int cartItems = 0;

  // @override
  @override
  Widget build(BuildContext context) {
    print('Build Called');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
            onTap: () {
              AuthenticationHelper().signOut();
              Navigator.pushNamed(context, Routes.loginRoute);
            },
            child: Icon(Icons.logout)),
        actions: [
          InkWell(
            onTap: () {
              Provider.of<DataProvider>(context, listen: false)
                  .calculateTotalBill();
              Navigator.of(context).pushNamed(Routes.cartScreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 8.0),
              child: Badge(
                badgeContent: Consumer<DataProvider>(
                  builder: (context, dataProvider, child) =>
                      Text(dataProvider.numberOfItems.toString()),
                ),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            showScanner
                ? Container(
                    height: 100,
                    width: 300,
                    child: QRView(
                      key: qrKey,
                      formatsAllowed: [
                        BarcodeFormat.aztec,
                        BarcodeFormat.codabar,
                        BarcodeFormat.code128,
                        BarcodeFormat.code39,
                        BarcodeFormat.code93,
                        BarcodeFormat.dataMatrix,
                        BarcodeFormat.ean13,
                        BarcodeFormat.ean8,
                        BarcodeFormat.itf,
                        BarcodeFormat.maxicode,
                        BarcodeFormat.pdf417,
                        BarcodeFormat.qrcode,
                        BarcodeFormat.rss14,
                        BarcodeFormat.rssExpanded,
                        BarcodeFormat.unknown,
                        BarcodeFormat.upcA,
                        BarcodeFormat.upcE,
                        BarcodeFormat.upcEanExtension,
                      ],
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Theme.of(context).primaryColor,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                    ),
                  )
                : Image.asset(
                    'assets/images/qr-code.png',
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),

            Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  String barcodeScanRes =
                      await FlutterBarcodeScanner.scanBarcode(
                          '#ff6666', 'Cancel', true, ScanMode.QR);
                  if (barcodeScanRes.isNotEmpty) {
                    Provider.of<DataProvider>(context, listen: false)
                        .updateCartItems(barcodeScanRes);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item added to cart successfully'),
                      ),
                    );
                    counter = 0;
                  }

                  print('DATA GATHERED  ' + barcodeScanRes);
                },
                // Provider.of<DataProvider>(context, listen: false)
                //     .updateCartItems();
                // showScanner = true;
                // setState(() {});

                // showScanner
                //     ? () {
                //         showScanner = false;

                //         setState(() {});
                //       }
                //     : () {
                //         showScanner = true;
                //         setState(() {});
                //       },
                child: Text('SCAN'),
              ),
            ),
            SizedBox(height: 50),
            // Text('Scanned Data : ' + result!),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Provider.of<DataProvider>(context, listen: false)
                      .calculateTotalBill();
                  Navigator.of(context).pushNamed(Routes.cartScreen);
                },
                child: Text('Go to cart!'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    print('HERE');
    await controller.scannedDataStream.listen(
      (scanData) {
        print('Not heree');
        showScanner = false;
        setState(() {});
        print('Scan Data' + scanData.toString());
        result = scanData.code;
        counter++;

        if (result!.isNotEmpty && counter < 2) {
          print('Result  $result');

          Provider.of<DataProvider>(context, listen: false)
              .updateCartItems(result);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Item added to cart successfully'),
            ),
          );
          counter = 0;
        }
        setState(() {});
      },
    );
    // showScanner = false;

    // result = '';
    // setState(() {});
  }
}
