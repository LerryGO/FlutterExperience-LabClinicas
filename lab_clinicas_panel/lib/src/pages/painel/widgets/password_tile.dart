import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PasswordTile extends StatelessWidget {
  const PasswordTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: LabClinicasTheme.orangeColor),
      ),
      child: const Column(
        children: [
          Text(
            'BFASD',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.blueColor,
            ),
          ),
          Text(
            'Guichê 01',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
