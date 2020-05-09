import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScanState();
  }
}

class ScanState extends State<ScanPage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('扫二维码页面')),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () {
            doScan();
          }),
      body: Container(
        child: Text('扫码结果=$result'),
      ),
    );
  }

  void doScan() async {
    String result = await BarcodeScanner.scan();
    setState(() {
      this.result = result;
    });
  }
}
