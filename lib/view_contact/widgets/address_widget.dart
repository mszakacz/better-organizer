import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AddressWidget extends StatelessWidget {
  final String address;
  const AddressWidget({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (address.length > 25) {
      return Marquee(
        text: address,
        pauseAfterRound: const Duration(seconds: 3),
        startAfter: const Duration(seconds: 1),
        startPadding: 5,
        blankSpace: 20,
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          address,
        ),
      );
    }
  }
}
