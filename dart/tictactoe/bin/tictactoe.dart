import 'dart:io';

void main() {
  var board = List.generate(3, (_) => List.filled(3, '-'));
  var player = 'X';
  printBoard(board, player);
  // bool isEnded = false;

  while (!checkWin(board, player) && !checkTie(board)) {
    // get player input
    // while (!isEnded) {
    print('Player $player choose a row (1-3)');
    int row = int.parse(stdin.readLineSync()!);
    print('Player $player choose a column (1-3)');
    int column = int.parse(stdin.readLineSync()!);

    // update board
    if (board[row - 1][column - 1] == '-') {
      board[row - 1][column - 1] = player;
      printBoard(board, player);
    } else {
      print('Spot already taken, try again');
      continue;
    }

    // switch player
    player = player == 'X' ? 'O' : 'X';
  }

  if (checkWin(board, player)) {
    print("Player $player wins!");
  } else {
    print("It's a tie!");
  }
}

void printBoard(List<List<String>> board, String player) {
  //print board
  for (var i = 0; i < board.length; i++) {
    print(board[i].join(' '));
  }
  print('');
}

bool checkWin(List<List<String>> board, String player) {
  // check row
  for (var r = 0; r < board.length; r++) {
    if (board[r][0] == player &&
        board[r][1] == player &&
        board[r][2] == player) {
      return true;
    }
  }

  // check columns
  for (var c = 0; c < board.length; c++) {
    if (board[0][c] == player &&
        board[1][c] == player &&
        board[2][c] == player) {
      return true;
    }
  }

  // check diagonals
  if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
    return true;
  }
  if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
    return true;
  }

  return false;
}

bool checkTie(List<List<String>> board) {
  // check tie
  for (var i = 0; i < board.length; i++) {
    for (var j = 0; j < board.length; j++) {
      if (board[i][j] == '-') {
        return false;
      }
    }
  }

  return true;
}
