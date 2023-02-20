import 'dart:math';

import 'package:flutter/material.dart';

// this is a hard levels
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Hard(),);
  }
}

class Hard extends StatefulWidget {
  const Hard({super.key});

  @override
  State<Hard> createState() => _HardState();
}

class _HardState extends State<Hard> {
  int xScore = 0, oScore = 0;

  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];

  bool oTurn = true;

  bool firstMove = true;
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
      if(oTurn && displayElement[index] == ''){
        displayElement[index] = 'O';
        oTurn = !oTurn;
        filledBoxes++;
      }
      _computerTurn();
      _checkWinner();
    });
  }

  void _computerTurn() {
    setState(() {
      //row 1
      if(!oTurn && filledBoxes < 8){
        if(displayElement[0] == 'X' && displayElement[1] == 'X' && displayElement[2] == ''){
          displayElement[2] = 'X';
        } else if(displayElement[0] == 'X' && displayElement[2] == 'X' && displayElement[1] == ''){
          displayElement[1] = 'X';
        } else if(displayElement[2] == 'X' && displayElement[1] == 'X' && displayElement[0] == ''){
          displayElement[0] = 'X';
        }

        // row 2
        else if(displayElement[3] == 'X' && displayElement[4] == 'X' && displayElement[5] == ''){
          displayElement[5] = 'X';
        } else if(displayElement[4] == 'X' && displayElement[5] == 'X' && displayElement[3] == ''){
          displayElement[3] = 'X';
        }else if(displayElement[5] == 'X' && displayElement[3] == 'X' && displayElement[4] == ''){
          displayElement[4] = 'X';
        }

        // row 3
        else if(displayElement[6] == 'X' && displayElement[7] == 'X' && displayElement[8] == ''){
          displayElement[7] = 'X';
        } else if(displayElement[7] == 'X' && displayElement[8] == 'X' && displayElement[6] == ''){
          displayElement[6] = 'X';
        }else if(displayElement[8] == 'X' && displayElement[6] == 'X' && displayElement[7] == ''){
          displayElement[7] = 'X';
        }


        // column 1
        else if(displayElement[0] == 'X' && displayElement[3] == 'X' && displayElement[6] == ''){
          displayElement[6] = 'X';
        } else if(displayElement[3] == 'X' && displayElement[6] == 'X' && displayElement[0] == ''){
          displayElement[0] = 'X';
        } else if(displayElement[6] == 'X' && displayElement[0] == 'X' && displayElement[3] == ''){
          displayElement[3] = 'X';
        }

        // column 2
        else if(displayElement[1] == 'X' && displayElement[4] == 'X' && displayElement[7] == ''){
          displayElement[7] = 'X';
        } else if(displayElement[4] == 'X' && displayElement[7] == 'X' && displayElement[1] == ''){
          displayElement[1] = 'X';
        }else if(displayElement[7] == 'X' && displayElement[1] == 'X' && displayElement[4] == ''){
          displayElement[4] = 'X';
        }

        // column 3
        else if(displayElement[2] == 'X' && displayElement[5] == 'X' && displayElement[8] == ''){
          displayElement[8] = 'X';
        } else if(displayElement[5] == 'X' && displayElement[8] == 'X' && displayElement[2] == ''){
          displayElement[2] = 'X';
        }else if(displayElement[8] == 'X' && displayElement[2] == 'X' && displayElement[5] == ''){
          displayElement[5] = 'X';
        }

        // diagonal 1
        else if(displayElement[0] == 'X' && displayElement[4] == 'X' && displayElement[8] == ''){
          displayElement[8] = 'X';
        } else if(displayElement[4] == 'X' && displayElement[8] == 'X' && displayElement[0] == ''){
          displayElement[0] = 'X';
        } else if(displayElement[8] == 'X' && displayElement[0] == 'X' && displayElement[4] == ''){
          displayElement[4] = 'X';
        }

        // diagonal 2
        else if(displayElement[2] == 'X' && displayElement[4] == 'X' && displayElement[6] == ''){
          displayElement[6] = 'X';
        } else if(displayElement[4] == 'X' && displayElement[6] == 'X' && displayElement[2] == ''){
          displayElement[2] = 'X';
        }else if(displayElement[6] == 'X' && displayElement[2] == 'X' && displayElement[4] == ''){
          displayElement[4] = 'X';
        }
        // row 1
        else if(displayElement[0] == 'O' && displayElement[1] == 'O' && displayElement[2] == ''){
          displayElement[2] = 'X';
        } else if(displayElement[1] == 'O' && displayElement[2] == 'O' && displayElement[0] == ''){
          displayElement[0] = 'X';
        } else if(displayElement[2] == 'O' && displayElement[0] == 'O' && displayElement[1] == ''){
          displayElement[1] = 'X';
        }

        // row 2
        else if(displayElement[3] == 'O' && displayElement[4] == 'O' && displayElement[5] == ''){
          displayElement[5] = 'X';
        } else if(displayElement[4] == 'O' && displayElement[5] == 'O' && displayElement[3] == ''){
          displayElement[3] = 'X';
        }else if(displayElement[5] == 'O' && displayElement[3] == 'O' && displayElement[4] == ''){
          displayElement[4] = 'X';
        }

        // row 3
        else if(displayElement[6] == 'O' && displayElement[7] == 'O' && displayElement[8] == ''){
          displayElement[7] = 'X';
        } else if(displayElement[7] == 'O' && displayElement[8] == '0' && displayElement[6] == ''){
          displayElement[6] = 'X';
        }else if(displayElement[8] == 'O' && displayElement[6] == 'O' && displayElement[7] == ''){
          displayElement[7] = 'X';
        }


        // column 1
        else if(displayElement[0] == 'O' && displayElement[3] == 'O' && displayElement[6] == ''){
          displayElement[6] = 'X';
        } else if(displayElement[3] == 'O' && displayElement[6] == 'O' && displayElement[0] == ''){
          displayElement[0] = 'X';
        } else if(displayElement[6] == 'O' && displayElement[0] == 'O' && displayElement[3] == ''){
          displayElement[3] = 'X';
        }

        // column 2
        else if(displayElement[1] == 'O' && displayElement[4] == 'O' && displayElement[7] == ''){
          displayElement[7] = 'X';
        } else if(displayElement[4] == 'O' && displayElement[7] == 'O' && displayElement[1] == ''){
          displayElement[1] = 'X';
        }else if(displayElement[7] == 'O' && displayElement[1] == 'O' && displayElement[4] == ''){
          displayElement[4] = 'X';
        }

        // column 3
        else if(displayElement[2] == 'O' && displayElement[5] == 'O' && displayElement[8] == ''){
          displayElement[8] = 'X';
        } else if(displayElement[5] == 'O' && displayElement[8] == 'O' && displayElement[2] == ''){
          displayElement[2] = 'X';
        }else if(displayElement[8] == 'O' && displayElement[2] == 'O' && displayElement[5] == ''){
          displayElement[5] = 'X';
        }

        // diagonal 1
        else if(displayElement[0] == 'O' && displayElement[4] == 'O' && displayElement[8] == ''){
          displayElement[8] = 'X';
        } else if(displayElement[4] == 'O' && displayElement[8] == 'O' && displayElement[0] == ''){
          displayElement[0] = 'X';
        } else if(displayElement[8] == 'O' && displayElement[0] == 'O' && displayElement[4] == ''){
          displayElement[4] = 'X';
        }

        // diagonal 2
        else if(displayElement[2] == 'O' && displayElement[4] == 'O' && displayElement[6] == ''){
          displayElement[6] = 'X';
        } else if(displayElement[4] == 'O' && displayElement[6] == 'O' && displayElement[2] == ''){
          displayElement[2] = 'X';
        }else if(displayElement[6] == 'O' && displayElement[2] == 'O' && displayElement[4] == ''){
          displayElement[4] = 'X';

        }

        // first move
        else if(firstMove){
          if(displayElement[4] == 'O'){
            displayElement[0] = 'X';
          } else{
            displayElement[4] = 'X';
          }
          firstMove = false;
        }

        // exception case
        else if(displayElement[4] == 'O' && displayElement[8] == 'O'&& displayElement[2] == ''){
          displayElement[2] = 'X';
        }

        else if(!oTurn) {
          while (true) {
            var rand = Random();
            int index = rand.nextInt(9);
            if (displayElement[index] == '') {
              displayElement[index] = 'X';
              break;
            }
          }
        }

        oTurn = !oTurn;
        filledBoxes++;
      }
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
    else if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }
    else if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }

    // Checking Column
    else if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    else if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }
    else if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }

    // Checking Diagonal
    else if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    else if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledBoxes >= 9) {
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
    oTurn = true;
    firstMove = true;
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
      _clearBoard();
    });
  }
}