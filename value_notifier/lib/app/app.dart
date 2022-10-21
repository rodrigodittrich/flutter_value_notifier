import 'package:flutter/material.dart';
import 'package:value_notifier/app/home_page.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.blueAccent 
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage()
    );
  }
}