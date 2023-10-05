import 'package:flutter/material.dart';
import 'detalhe.dart';


class Funcionarios extends StatefulWidget {
  const Funcionarios({Key? key}) : super(key: key);

  @override
  FuncionariosState createState() => FuncionariosState();
}

List<dynamic> data = [
  {"id": 1, "name": "Funcionario A"},
  {"id": 2, "name": "Funcionario B"},
  {"id": 3, "name": "Funcionario C"}
];

class FuncionariosState extends State<Funcionarios> {
  int selecionadoIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0),
            const Text('Funcionarios cadastrados',
                style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 50.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selecionadoIndex =
                              index; // Atualiza o índice selecionado
                        });
                      },
                      child: Padding(
                        key: Key(item["id"].toString()),
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selecionadoIndex == index
                                ? Colors.blue
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nome: ${item['name']}',
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(220, 20),
              ),
              onPressed: () {
                String nomeSelecionado = "";

                if (selecionadoIndex != -1) {
                  nomeSelecionado = data[selecionadoIndex]["name"];
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetalheFuncionario(nome: nomeSelecionado),
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
