import 'package:flutter/cupertino.dart';
import 'package:value_notifier/app/contato_entity.dart';

class ContatoController extends ValueNotifier<List<ContatoEntity>> {
  ContatoController() : super([]);

  ValueNotifier<List<ContatoEntity>> contatosNotifier = ValueNotifier([]);
  
  salvar(ContatoEntity contato) {
    final List<ContatoEntity> contatos = [...contatosNotifier.value];
    contatos.add(contato);
    contatosNotifier.value = contatos; 
  }

}