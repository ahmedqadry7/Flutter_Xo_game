import 'package:flutter/material.dart';
import 'package:session_7_flutter3/PlayersModel.dart';
import 'package:session_7_flutter3/board_btn.dart';

class HomePage extends StatefulWidget {
  static const routeName = "homepage";
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int score1 = 0, score2 = 0;
  int counter = 1;
  List<String> boardState = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    PlayerMode mode = ModalRoute.of(context)!.settings.arguments as PlayerMode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "TIC TAC TOE",
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        mode.player1,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "$score1",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        mode.player2,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "$score2",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(
                    label: boardState[0], index: 0, onClick: onBoardBtnClick),
                BoardBtn(
                    label: boardState[1], index: 1, onClick: onBoardBtnClick),
                BoardBtn(
                    label: boardState[2], index: 2, onClick: onBoardBtnClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(
                    label: boardState[3], index: 3, onClick: onBoardBtnClick),
                BoardBtn(
                    label: boardState[4], index: 4, onClick: onBoardBtnClick),
                BoardBtn(
                    label: boardState[5], index: 5, onClick: onBoardBtnClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(
                    label: boardState[6], index: 6, onClick: onBoardBtnClick),
                BoardBtn(
                    label: boardState[7], index: 7, onClick: onBoardBtnClick),
                BoardBtn(
                    label: boardState[8], index: 8, onClick: onBoardBtnClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onBoardBtnClick(index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter.isOdd) {
      boardState[index] = "X";
      bool win = checkWin("X");
      if (win) {
        score1 += 10;
        resetBoard();
      }
    } else {
      boardState[index] = "O";
      bool win = checkWin("O");
      if (win) {
        score2 += 10;
        resetBoard();
      }
    }
    if (counter == 9 && !checkWin("X") && !checkWin("O")) {
      resetBoard();
    }
    setState(() {});
    counter++;
  }

  bool checkWin(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  resetBoard() {
    boardState = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }
}
