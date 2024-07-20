import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_panel/src/pages/painel/widgets/painel_principal_widget.dart';

import 'widgets/password_tile.dart';

class PainelPage extends StatelessWidget {
  const PainelPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: const PainelPrincipalWidget(
                    passwordLabel: 'Senha anterior',
                    password: 'BG4123',
                    deskNumber: '03',
                    buttonColor: LabClinicasTheme.blueColor,
                    labelColor: LabClinicasTheme.orangeColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: const PainelPrincipalWidget(
                    passwordLabel: 'Chamando senha',
                    password: 'BG4123',
                    deskNumber: '03',
                    buttonColor: LabClinicasTheme.orangeColor,
                    labelColor: LabClinicasTheme.blueColor,
                  ),
                ),
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
            const Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
