import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/documents/widgets/documents_box_widget.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/widget/lab_clinicas_self_services_app_bar.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicasSelfServicesAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/folder.png'),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'ADICIONAR DOCUMENTOS',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Selecione o documento que deseja fotografar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: LabClinicasTheme.blueColor,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: sizeOf.width * 0.8,
                  height: 300,
                  child: Row(
                    children: [
                      DocumentsBoxWidget(
                        uploaded: true,
                        icon: Image.asset('assets/images/id_card.png'),
                        label: 'CARTEIRINHA',
                        totalFiles: 0,
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      DocumentsBoxWidget(
                        uploaded: false,
                        icon: Image.asset('assets/images/document.png'),
                        label: 'PEDIDO MÉDICO',
                        totalFiles: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: () {},
                        child: const Text('REMOVER TODAS'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LabClinicasTheme.orangeColor,
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: () {},
                        child: const Text('FINALIZAR'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
