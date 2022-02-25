import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class Codes extends StatefulWidget {
  const Codes({ Key? key }) : super(key: key);

  @override
  State<Codes> createState() => _CodesState();
}

class _CodesState extends State<Codes> {
String controller = '';

String qrcodeRes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    controller = '';
                  });
                } else {
                  setState(() {
                    controller = value;
                  });
                }
              },
              decoration:
                  const InputDecoration(label: Text("Enter text to generate")),
            ),

            const SizedBox(
              height: 20,
            ),

            ///Qrcode widget
            // BarcodeWidget(data: controller.trim(), barcode: Barcode.code128()),

            const SizedBox(
              height: 30,
            ),

            Text(qrcodeRes.isNotEmpty ? qrcodeRes : "No Code"),        
          
          
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        backgroundColor: Colors.indigo.shade800,
        foregroundColor: Colors.white,
        onPressed: scanCode,
      ),
    );
  }

  void scanCode() async {
    String res = await FlutterBarcodeScanner.scanBarcode(
        "#ffffff", 'Cancel', true, ScanMode.QR);
    setState(() {
      qrcodeRes = res;
    });
  }
}

