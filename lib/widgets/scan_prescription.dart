import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/Utilities/size_helpers.dart';
import 'package:pharmix/widgets/blue_button.dart';

class ScanPrescription extends StatelessWidget {
  const ScanPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidthSize(context) * 0.9,
        height: screenHeightSize(context) * 0.065,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F8FBDFD),
              blurRadius: 7,
              offset: Offset(0, 4),
              spreadRadius: 4,
            )
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              scanIcon,
              width: screenWidthSize(context) * 0.07,
              height: screenHeightSize(context) * 0.03,
            ),
            const SizedBox(
              width: 16,
            ),
            const Text(
              'Scan Prescription',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              width: 120,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const BlueButton(
                title: 'Scan',
                fontSize: 15,
                radiusCurve: 12,
                blurRadius: 100,
              ),
            ),
          ],
        ));
  }
}
