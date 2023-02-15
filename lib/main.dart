import 'package:flutter/material.dart';

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
  int xScore = 0, oScore = 0;

  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];

  bool oTurn = true;

  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TIC TAC TOE"),),
      body: Column(
        children: [

          // SCORES
          Row(
            children: [
              // x Score
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 30),
                      child: const Text(
                        'Player X',
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        xScore.toString(),
                        style: const TextStyle(fontSize: 20,color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),

              // o Score
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 80, top: 30),
                      child: const Text(
                        'Player O',
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 80, top: 10),
                      child: Text(
                        oScore.toString(),
                        style: const TextStyle(fontSize: 20,color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // tic tac toe Board
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){_onTap(index);},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        displayElement[index],
                        style: const TextStyle(color: Colors.black, fontSize: 35),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 9,
            ),
          ),

          // Clear board and scores
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // X Score Card
              Container(
                margin: const EdgeInsets.only(bottom: 30,left: 20),
                child: ElevatedButton(
                  onPressed: (){_clearBoard();},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text("Clear Board"),
                ),
              ),

              // O Score Card
              Container(
                margin: const EdgeInsets.only(left: 165, bottom: 30),
                child: ElevatedButton(
                  onPressed: (){_clearScoreBoard();},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text("Clear All"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Show the respective response on tapping the box
  void _onTap(int index){
    setState(() {
      if(oTurn && displayElement[index] == '') {
        displayElement[index] = 'O';
      } else if(!oTurn && displayElement[index] == '') {
        displayElement[index] = 'X';
      }

      oTurn = !oTurn;
      filledBoxes++;

      _checkWinner();
    });
  }

  // checks if any player won or not
  void _checkWinner() {

    // Checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }

    // Checking Column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }

    // Checking Diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  // Display AlertDialog for winner
  void _showWinDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("\" $winner \" is Winner!!!"),
            actions: [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  _clearBoard();
                },
                child: const Text("Play Again"),
              ),
            ],
          );

        }
    );

    setState(() {
      if (winner == 'O') {
        oScore++;
      } else if (winner == 'X') {
        xScore++;
      }
    });
  }

  // Display AlertDialog for draw match
  void _showDrawDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Draw!!!"),
            actions: [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  _clearBoard();
                },
                child: const Text("Play Again"),
              ),
            ],
          );

        }
    );
  }


  // Clear Board but not the scores
  _clearBoard() {
    //print(filledBoxes);
    setState(() {
      for(int i = 0; i < 9; i++){
        displayElement[i] = '';
      }
    });
    filledBoxes = 0;
    //print(filledBoxes);
  }

  // clear everything and start new game
  _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      oTurn = true;

      _clearBoard();
    });
  }


}