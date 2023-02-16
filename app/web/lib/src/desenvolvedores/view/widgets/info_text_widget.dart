import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:web/src/desenvolvedores/models/desenvolvedores_model.dart';

class InfoTextWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final String title;
  final String hint;
  final double size;

  const InfoTextWidget(
      {super.key,
      required this.constraints,
      required this.title,
      required this.hint,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.05,
      width: constraints.maxWidth * 0.15,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: size,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
