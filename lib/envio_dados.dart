import 'package:flutter/material.dart';
import 'funcionarios.dart';

// ignore: camel_case_types
class EnviaDados extends StatefulWidget {
  const EnviaDados({super.key});

  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<EnviaDados> {
  Color textColor = Colors.black; 
  Color textColorWarning = Colors.grey;
  Color borderColor = Colors.grey;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30.0),
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Torna o container circular
                image: DecorationImage(
                  image: AssetImage('assets/images/flutter.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Dados Enviados com Sucesso!!',
                style: TextStyle(fontSize: 25.0)),

            const SizedBox(height: 50.0),
            SizedBox(
              width: 170,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Funcionarios(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(220, 20),
                ),
                child: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
