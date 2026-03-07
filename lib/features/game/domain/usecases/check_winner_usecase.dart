import 'package:tictactoe_app/features/game/domain/entities/game_state_entity.dart';

class CheckWinnerUsecase {
  String? call({required List<String> board}) {
    var combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [6, 4, 2],
      [0, 4, 8],
    ];

    for (int i = 0; i < combinations.length; i++) {
      var isXWinner = true;
      var isOWinner = true;
      for (int j = 0; j < 3; j++) {
        if (board[combinations[i][j]] != "X") {
          isXWinner = false;
        }

        if (board[combinations[i][j]] != "O") {
          isOWinner = false;
        }
      }

      if (isXWinner) {
        return "X";
      } else if (isOWinner) {
        return "O";
      }
    }
    return null;
  }
}
