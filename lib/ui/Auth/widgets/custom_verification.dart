// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomVerification extends StatelessWidget {
  Function onComplete;
  Function onValidate;

  CustomVerification(
      {required this.onComplete, required this.onValidate, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Pinput(
        showCursor: true,
        validator: (value) {
          onValidate();
        },
        defaultPinTheme: PinTheme(
            height: 68,
            width: 74,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffDFE7F7))),
        onCompleted: (value) {
          onComplete();
        },
      ),
    );
  }
}
