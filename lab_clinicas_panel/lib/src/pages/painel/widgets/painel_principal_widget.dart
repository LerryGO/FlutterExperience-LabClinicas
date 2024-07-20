import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PainelPrincipalWidget extends StatelessWidget {
  const PainelPrincipalWidget({
    super.key,
    required this.deskNumber,
    required this.passwordLabel,
    required this.labelColor,
    required this.buttonColor,
    required this.password,
  });

  final String password;
  final String passwordLabel;
  final String deskNumber;
  final Color labelColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(32),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: LabClinicasTheme.orangeColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              passwordLabel,
              style: LabClinicasTheme.titleStyle.copyWith(color: labelColor),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                password,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Guichê',
              style: LabClinicasTheme.titleStyle.copyWith(color: labelColor),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                deskNumber,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
