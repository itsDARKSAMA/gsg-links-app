import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQrCard extends StatelessWidget {
  final String qrData;

  const CustomQrCard({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 294,
        width: 294,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: QrImageView(
            data: qrData,
            version: QrVersions.auto,
          ),
        ),
      ),
    );
  }
}
