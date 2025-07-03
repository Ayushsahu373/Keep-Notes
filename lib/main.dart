import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision_app/01june/Screens/Home_Screen.dart';
import 'package:revision_app/01june/provider/Notes_provider.dart';
import 'package:revision_app/30062025/UI/Screen1.dart';
import 'package:revision_app/30062025/provider/DataProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // create: (context) => Dataprovider(),
      create: (context) => NotesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revision App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      // const Screen1(),
    );
  }
}
