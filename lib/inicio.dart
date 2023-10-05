import 'package:flutter/material.dart';
import 'funcionarios.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {
  Color textColor = Colors.black;
  Color textColorWarning = Colors.grey;
  Color borderColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                child: const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
