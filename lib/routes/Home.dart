import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/logic/Board.dart';

class Home extends StatelessWidget {
  final Board board = Board();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is a title"),
      ),
      body: Wrap(
        spacing: 30,
        runSpacing: 20,
        children: board.toList(),
      )
    );
  }
}
