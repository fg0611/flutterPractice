import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String qrcodeRes = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR app"),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 32,
                width: double.infinity,
                color: Colors.blue[900],
              ),
              const SizedBox(
                  height: 30,
                  child: Text(
                    "Scan a QR code",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 30),
                  )),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 300,
                  width: 300,
                  child: MobileScanner(onDetect: (barcode, args) {
                    final String? code = barcode.rawValue;
                    debugPrint('Barcode found! $code');
                    setState(() {
                      qrcodeRes = code!;
                    });
                  }),
                ),
              ),
              const Divider(color: Colors.grey, height: 3),
              Center(
                  child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: const FixedColumnWidth(120.0),
                    children: [
                      TableRow(children: [
                        Column(children: const [
                          Text('To Pay', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: const [
                          Text("20.00", style: TextStyle(fontSize: 20.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: const [
                          Text('Tip', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: const [
                          Text("0.00", style: TextStyle(fontSize: 20.0))
                        ]),
                      ]),
                    ],
                  ),
                ),
              ])),
              const Divider(color: Colors.grey, height: 3),
              Center(
                  child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: const FixedColumnWidth(120.0),
                    children: [
                      TableRow(children: [
                        Column(children: const [
                          Text('Total', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: const [
                          Text("20.00", style: TextStyle(fontSize: 20.0))
                        ]),
                      ])
                    ],
                  ),
                ),
              ])),
              const Divider(color: Colors.grey, height: 3),
              Text(qrcodeRes.isNotEmpty ? qrcodeRes : "No Code"),
              Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 15)),
                      child: const Text('Payment'),
                      onPressed: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
