import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DataItem extends StatelessWidget {
  final String label;
  final String value;
  final EdgeInsetsGeometry? padding;

  const DataItem(
      {super.key, required this.label, required this.value, this.padding});

  @override
  Widget build(BuildContext context) {
    Widget widget = Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 14,
            color: LabClinicasTheme.blueColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: LabClinicasTheme.orangeColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

    if (padding != null) {
      widget = Padding(padding: padding!, child: widget);
    }

    return widget;
  }
}
