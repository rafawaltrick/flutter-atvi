import 'package:flutter/material.dart';
import 'envio_dados.dart';

class FormularioFuncionario extends StatefulWidget {
  final String nome;
  final String funcao;

  const FormularioFuncionario({
    Key? key,
    required this.nome,
    required this.funcao,
  }) : super(key: key);

  @override
  FormularioFuncionarioState createState() =>
      FormularioFuncionarioState(nome: nome, funcao: funcao);
}

class FormularioFuncionarioState extends State<FormularioFuncionario> {
  final TextEditingController _nome;
  final TextEditingController _cargo;
  final TextEditingController _tempoNaFuncao = TextEditingController();

  Color textColor = Colors.black;
  Color textColorWarning = Colors.grey;
  Color borderColor = Colors.grey;

  FormularioFuncionarioState({required String nome, required String funcao})
      : _nome = TextEditingController(text: nome),
        _cargo = TextEditingController(text: funcao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Funcionário Selecionado',
              style: TextStyle(fontSize: 28.0, color: Colors.blue),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _nome,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: _nome.text, // Use o valor do _nome como hintText
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Função Selecionada',
              style: TextStyle(fontSize: 28.0, color: Colors.blue),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _cargo,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: _cargo.text,
                  prefixIcon: const Icon(Icons.email),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Tempo na Função',
              style: TextStyle(fontSize: 28.0, color: Colors.blue),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _tempoNaFuncao,
                keyboardType: TextInputType.number,
                decoration: const  InputDecoration(
                  hintText: 'Tempo na função',
                  prefixIcon:  Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(220, 20),
              ),
              onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EnviaDados(),
                                ),
                              );
                      },
              child: const Text('Selecionar'),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
