import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/sharepref.dart';
import 'confirm_screen.dart';
import 'home_screen.dart';

typedef StringValue = String Function(String);

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key,required this.attendanceMode}) : super(key: key);
  final String attendanceMode;

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    controller?.flipCamera();
    if (defaultTargetPlatform == TargetPlatform.android) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: _buildQrView(context)),

        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      cameraFacing: CameraFacing.front,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,

          cutOutWidth: MediaQuery.of(context).size.width,
          cutOutHeight: MediaQuery.of(context).size.height),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),

    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      SharedPreferences pref =
      await SharedPreferences.getInstance();
      setState(() {
        result = scanData;

//                             await controller?.pauseCamera();
        if (result != null && pref.getBool(Sharepref.isQrCodeScan) as bool) {
          pref.setBool(Sharepref.isQrCodeScan, false);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ConfirmScreen(dataStr: '${result!.code}',
                        attendanceMode: widget.attendanceMode,
                        type: "qr",
                        name: "",
                        id: 0,
                        documentType: 0,
                        scheduleId: 0, scheduleEventName: "",scheduleEventTime: "",enableWalkin:0 )));
          try {
            if (defaultTargetPlatform == TargetPlatform.android) {
              controller!.pauseCamera();
            }
            controller!.resumeCamera();
          }catch(e){
            print("_onQRViewCreated :$e");
          }
        }

      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');

    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
      Future.delayed(Duration(seconds: 15), () {
        try {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()));
        }catch(e){
          print("Error :"+e.toString());
        }
      });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
