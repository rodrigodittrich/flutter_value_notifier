import 'package:flutter/material.dart';
import 'package:value_notifier/app/contato_controller.dart';
import 'package:value_notifier/app/contato_entity.dart';

class ContatosPage extends StatelessWidget {
  ContatosPage({super.key});

  final contatoController = ContatoController();

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de contatos")),
      body: Column(
        children: [
          ValueListenableBuilder<List<ContatoEntity>>(
            valueListenable: contatoController.contatosNotifier, 
            builder: (context, contatos, child) {
              if(contatos.isEmpty) return const Center(child: Text("Nenhum contato cadastrado"));
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: contatos.length,
                itemBuilder: (context, item) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${contatos[item].nome}"),
                        IconButton(
                          onPressed: () {
                            contatoController.deletar(contatos[item]);
                          }, 
                          icon: const Icon(Icons.delete)
                        )
                      ],
                    )
                  );
                }
              );
            }
          )
        ],

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              nomeController.clear();
              return AlertDialog(
                content: TextFormField(
                  controller: nomeController,
                ),
                title: const Text("Novo contato"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    child: const Text("Cancelar")
                  ),
                  ElevatedButton(
                    onPressed: () {
                      contatoController.salvar(ContatoEntity(nome: nomeController.text));
                      Navigator.of(context).pop();
                    }, 
                    child: const Text("Salvar")
                  )
                ],
              );
            }
          );
        }, 
        label: const Text("Novo"),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}