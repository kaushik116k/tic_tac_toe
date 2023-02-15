import 'package:first_app/player.dart';
import 'package:flutter/material.dart';

import 'computer.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage(),);
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                  "Tic Tac Toe",
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Player()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text("vs Player"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Computer()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text("vs Computer"),
            ),
          ],
        ),
      ),
    );
  }
}