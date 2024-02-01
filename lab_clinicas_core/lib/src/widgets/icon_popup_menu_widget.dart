import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class IconPopupMenuWidget extends StatelessWidget {
  const IconPopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: LabClinicasTheme.orangeColor, width: 2),
        ),
        child: const Icon(
          Icons.more_horiz_rounded,
          color: LabClinicasTheme.orangeColor,
        ),
      ),
    );
  }
}
