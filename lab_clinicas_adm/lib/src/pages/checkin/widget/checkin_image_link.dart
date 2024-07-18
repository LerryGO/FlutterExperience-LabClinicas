import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import 'checkin_image_dialog.dart';

class CheckinImageLink extends StatelessWidget {
  final String label;
  final String image;

  const CheckinImageLink({required this.label, required this.image, super.key});

  void showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CheckinImageDialog(context, pathImage: image);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showImageDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: LabClinicasTheme.blueColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
