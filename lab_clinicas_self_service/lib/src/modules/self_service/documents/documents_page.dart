import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/documents/widgets/documents_box_widget.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/widget/lab_clinicas_self_services_app_bar.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> with MessageViewMixin {
  final SelfServiceController selfServiceController =
      Injector.get<SelfServiceController>();

  @override
  void initState() {
    messageListener(selfServiceController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final documents = selfServiceController.model.documents;
    final totalHealthInsuranceCard =
        documents?[DocumentType.healthInsuranceCard]?.length ?? 0;
    final totalMedicalOrder =
        documents?[DocumentType.medicalOrder]?.length ?? 0;

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
                        uploaded: totalHealthInsuranceCard > 0,
                        icon: Image.asset('assets/images/id_card.png'),
                        label: 'CARTEIRINHA',
                        totalFiles: totalHealthInsuranceCard,
                        onTap: () async {
                          final filePath = await Navigator.of(context)
                              .pushNamed('/self-service/documents/scan');
                          if (filePath != null && filePath != '') {
                            selfServiceController.registerDocument(
                              DocumentType.healthInsuranceCard,
                              filePath.toString(),
                            );
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      DocumentsBoxWidget(
                        uploaded: totalMedicalOrder > 0,
                        icon: Image.asset('assets/images/document.png'),
                        label: 'PEDIDO MÉDICO',
                        totalFiles: totalMedicalOrder,
                        onTap: () async {
                          final filePath = await Navigator.of(context)
                              .pushNamed('/self-service/documents/scan');
                          if (filePath != null && filePath != '') {
                            selfServiceController.registerDocument(
                              DocumentType.medicalOrder,
                              filePath.toString(),
                            );
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Visibility(
                  visible:
                      totalMedicalOrder > 0 && totalHealthInsuranceCard > 0,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            fixedSize: const Size.fromHeight(48),
                          ),
                          onPressed: selfServiceController.clearDocuments,
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
