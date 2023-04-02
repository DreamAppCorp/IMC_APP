import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BarraColor extends StatelessWidget {
  const BarraColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color: Colors.blue,
          ),
          width: MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.all(20),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.all(20),
          color: const Color(0xFF10cfff),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.all(20),
          color: const Color(0xFF71dffa),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.all(20),
          color: const Color(0xFF0acea2),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.all(20),
          color: const Color(0xFFf7c332),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.all(20),
          color: const Color(0xFFea5b0c),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: const Color(0xFFe40613),
          ),
        ),
      ],
    ));
  }
}
