import 'package:flutter/material.dart';

enum Tile { X, O }

extension TileExtension on Tile {
  String get symbol {
    switch(this) {
      case Tile.X:
        return 'X';
      case Tile.O:
        return 'O';
      default:
        return 'E';
    }
  }
}

class Board {
  List<List<Tile>> b;

  Board() {
    b = new List.generate(3, (_) => new List<Tile>(3), growable: false);
  }

  Tile checkRows() {
    for (int i = 0; i < 3; ++i) {
      int XCounter = 0;
      int OCounter = 0;
      for (int j = 0; j < 3; ++j) {
        switch(b[i][j]) {
          case Tile.X:
            ++XCounter;
            break;
          case Tile.O:
            ++OCounter;
            break;
          default:
        }
      }
      if (XCounter == 3) return Tile.X;
      if (OCounter == 3) return Tile.O;
    }
  }

  Tile checkCols() {
    for (int j = 0; j < 3; ++j) {
      int XCounter = 0;
      int OCounter = 0;
      for (int i = 0; i < 3; ++i) {
        switch(b[i][j]) {
          case Tile.X:
            ++XCounter;
            break;
          case Tile.O:
            ++OCounter;
            break;
          default:
        }
      }
      if (XCounter == 3) return Tile.X;
      if (OCounter == 3) return Tile.O;
    }
  }

  Tile checkDiags() {
    int XCounter = 0;
    int OCounter = 0;
    for (int i = 0; i < 3; ++i) {
      switch(b[i][i]) {
        case Tile.X:
          ++XCounter;
          break;
        case Tile.O:
          ++OCounter;
          break;
        default:
      }
    }
    if (XCounter == 3) return Tile.X;
    if (OCounter == 3) return Tile.O;

    XCounter = 0;
    OCounter = 0;
    for (int i = 0; i < 3; ++i) {
      switch(b[i][2 - i]) {
        case Tile.X:
          ++XCounter;
          break;
        case Tile.O:
          ++OCounter;
          break;
        default:
      }
    }
    if (XCounter == 3) return Tile.X;
    if (OCounter == 3) return Tile.O;
  }

  bool isEmpty() {
    for (int i = 0; i < 3; ++i) {
      for (int j = 0; j < 3; ++j) {
        if (b[i][j].symbol == ' ') {
          return true;
        }
      }
    }
    return false;
  }

  List<FlatButton> toList() {
    List<FlatButton> list = List(9);
    for (int i = 0; i < 3; ++i) {
      for (int j = 0; j < 3; ++j) {
        list[i*3 + j] = FlatButton(
          onPressed: () {},
          child: Text(b[i][j].symbol),
        );
      }
    }
    return list;
  }
}