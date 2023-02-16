import 'package:flutter/material.dart';

import 'Levels/easy.dart';
import 'Levels/hard.dart';
import 'Levels/medium.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Computer(),);
  }
}

class Computer extends StatefulWidget{
  const Computer({super.key});

  @override
  State<Computer> createState() => _ComputerState();
}

class _ComputerState extends State<Computer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 380,
              child: Center(
                child: Text(
                  "vs Computer",
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Easy()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text("Easy"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Medium()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text("Medium"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Hard()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text("Hard"),
            ),
          ],
        ),
      ),
    );
  }
}

