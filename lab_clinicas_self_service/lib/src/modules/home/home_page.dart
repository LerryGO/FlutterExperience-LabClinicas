import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(
        actions: [
          PopupMenuButton<int>(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Iniciar terminal'),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Iniciar terminal'),
                ),
              ];
            },
          )
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 112),
          padding: const EdgeInsets.all(40),
          width: sizeOf.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: LabClinicasTheme.orangeColor,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Bem Vindo!',
                style: LabClinicasTheme.titleStyle,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: sizeOf.width * .8,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('INICIAR TERMINAL'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
