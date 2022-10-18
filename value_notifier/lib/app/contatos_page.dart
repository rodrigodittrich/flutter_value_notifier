import 'package:flutter/material.dart';

class ContatosPage extends StatelessWidget {
  const ContatosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de contatos")),
      body: Column(

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
                      print("Salvar contato");
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