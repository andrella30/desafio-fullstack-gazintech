import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LayoutDesenvInfo extends StatelessWidget {
  final String tipo;
  final String title;

  const LayoutDesenvInfo({super.key, required this.tipo, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 25),
      child: Row(
        children: [
          Text(
            "$tipo: ",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
