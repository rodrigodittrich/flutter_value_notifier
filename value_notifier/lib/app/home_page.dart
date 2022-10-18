import 'package:flutter/material.dart';
import 'package:value_notifier/app/contatos_page.dart';
import 'package:value_notifier/app/counter_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _counter = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Value Notifier")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('AnimatedBuilder'),
            AnimatedBuilder(
              animation: _counter,
              builder: (context, child) {
                return Text(
                  '${_counter.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            ),
            const SizedBox(height: 30),
            const Text('ValueListenableBuilder'),
            ValueListenableBuilder(
              valueListenable: _counter, 
              builder: (context, value, child){
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ContatosPage())
                );
              }, 
              child: const Text("List Builder")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}