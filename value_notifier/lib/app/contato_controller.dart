import 'package:flutter/cupertino.dart';
import 'package:value_notifier/app/contato_entity.dart';

class ContatoController {
  ContatoController();

  ValueNotifier<List<ContatoEntity>> contatosNotifier = ValueNotifier([]);
  
  salvar(ContatoEntity contato) {
    final List<ContatoEntity> contatos = [...contatosNotifier.value];
    contatos.add(contato);
    contatosNotifier.value = contatos; 
  }

  deletar(ContatoEntity contato) {
    final List<ContatoEntity> contatos = [...contatosNotifier.value];
    contatos.remove(contato);
    contatosNotifier.value = contatos; 
  }

}