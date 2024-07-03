import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DocumentsBoxWidget extends StatelessWidget {
  final Widget icon;
  final bool uploaded;
  final String label;
  final int totalFiles;
  const DocumentsBoxWidget(
      {required this.uploaded,
      required this.icon,
      required this.label,
      required this.totalFiles,
      super.key});

  @override
  Widget build(BuildContext context) {
    final totalFileLabel = totalFiles > 0 ? '($totalFiles)' : '';
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: uploaded ? LabClinicasTheme.lightOrangeColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: LabClinicasTheme.orangeColor,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: icon),
            Text(
              '$label $totalFileLabel',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: LabClinicasTheme.orangeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
