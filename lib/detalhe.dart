// ignore: file_names
import 'package:flutter/material.dart';
import 'formulario_funcionario.dart';

// ignore: camel_case_types
class DetalheFuncionario extends StatefulWidget {
  final String nome;

  const DetalheFuncionario({
    Key? key,
    required this.nome,
  }) : super(key: key);

  @override
  FormsState createState() => FormsState(nome: nome);
}

List<dynamic> data = [
  {"id": 1, "name": "Estagiario"},
  {"id": 2, "name": "Programador"},
  {"id": 3, "name": "Gerente de Projeto"},
  {"id": 4, "name": "Analista"}
];

class FormsState extends State<DetalheFuncionario> {
  final TextEditingController _selecionado;
  int selecionadoIndex = -1;

  FormsState({required String nome})
      : _selecionado = TextEditingController(text: nome);

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50.0),
            const Text('Funcionario Selecionado',
                style: TextStyle(fontSize: 25.0, color: Colors.blue)),
                const SizedBox(height: 10.0),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _selecionado,
                decoration: InputDecoration(
                  hintText: '$_selecionado',
                  prefixIcon: const Icon(Icons.analytics),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
                        const SizedBox(height: 50.0),
            const Text('Selecionar Função', style: TextStyle(fontSize: 25.0, color: Colors.blue)),
            Expanded(
              // Wrap the ListView.builder with Expanded
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
                                Text('${item['name']}',
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
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                String funcaoSelecionado = "";

                if (selecionadoIndex != -1) {
                  funcaoSelecionado = data[selecionadoIndex]["name"];
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormularioFuncionario(nome: _selecionado.text, funcao: funcaoSelecionado),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(180, 50),
              ),
              child: const Text('Selecionar'),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
