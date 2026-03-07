import 'package:tictactoe_app/features/game/domain/entities/game_state_entity.dart';

class MakeMoveUsecase {
  GameStateEntity call({required GameStateEntity state, required int index}) {
    List<String> board = List.from(state.board);
    board[index] = state.currentPlayer;
    return GameStateEntity(
      board: board,
      //se a jogada anterio foi do X, currentePlayer = O, se não X
      currentPlayer: state.currentPlayer == "X" ? "O" : "X",
      isGameOver: state.isGameOver,
    );
  }
}
