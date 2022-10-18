import 'package:flutter/material.dart';
import 'package:value_notifier/app/contato_controller.dart';
import 'package:value_notifier/app/contato_entity.dart';

class ContatosPage extends StatelessWidget {
  ContatosPage({super.key});

  final contatoController = ContatoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de contatos")),
      body: Column(
        children: [
          ValueListenableBuilder<List<ContatoEntity>>(
            valueListenable: contatoController.contatosNotifier, 
            builder: (context, contatos, child) {
              return Text(contatos.length.toString());
            }
          )
        ],

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                content: TextFormField(),
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
                      contatoController.salvar(ContatoEntity(nome: "Rodrigo"));
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