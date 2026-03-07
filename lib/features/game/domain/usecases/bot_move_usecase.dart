import 'dart:math';

class BotMoveUsecase {
  int call(List<String> board) {
    var emptyPositions = [];

    for (int i = 0; i < board.length; i++) {
      if (board[i] == "") {
        emptyPositions.add(i);
      }
    }
    var indexValue = Random().nextInt(emptyPositions.length);

    return emptyPositions[indexValue];
  }
}
