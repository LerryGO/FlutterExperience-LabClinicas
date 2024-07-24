import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_panel/src/models/painel_checkin_model.dart';
import 'package:lab_clinicas_panel/src/pages/painel/painel_controller.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'widgets/painel_principal_widget.dart';
import 'widgets/password_tile.dart';

class PainelPage extends StatefulWidget {
  const PainelPage({super.key});

  @override
  State<PainelPage> createState() => _PainelPageState();
}

class _PainelPageState extends State<PainelPage> {
  final controller = Injector.get<PainelController>();

  @override
  void initState() {
    controller.listenerPainel();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PainelCheckinModel? current;
    final PainelCheckinModel? lastCall;
    final List<PainelCheckinModel>? others;

    final listaPainel = controller.painelData.watch(context);

    current = listaPainel.firstOrNull;
    if (listaPainel.isNotEmpty) {
      listaPainel.removeAt(0);
    }

    lastCall = listaPainel.firstOrNull;
    if (listaPainel.isNotEmpty) {
      listaPainel.removeAt(0);
    }

    others = listaPainel;

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                lastCall != null
                    ? SizedBox(
                        width: MediaQuery.sizeOf(context).width * .4,
                        child: PainelPrincipalWidget(
                          passwordLabel: 'Senha anterior',
                          password: lastCall.password,
                          deskNumber:
                              lastCall.attendantDesk.toString().padLeft(2, '0'),
                          buttonColor: LabClinicasTheme.blueColor,
                          labelColor: LabClinicasTheme.orangeColor,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  width: 20,
                ),
                current != null
                    ? SizedBox(
                        width: MediaQuery.sizeOf(context).width * .4,
                        child: PainelPrincipalWidget(
                          passwordLabel: 'Chamando senha',
                          password: current.password,
                          deskNumber:
                              current.attendantDesk.toString().padLeft(2, '0'),
                          buttonColor: LabClinicasTheme.orangeColor,
                          labelColor: LabClinicasTheme.blueColor,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              color: LabClinicasTheme.orangeColor,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Últimos chamados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: others
                  .map(
                    (p) => PasswordTile(
                      password: p.password,
                      deskNumber: p.attendantDesk.toString(),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
