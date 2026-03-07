import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe_app/features/game/domain/entities/game_state_entity.dart';
import 'package:tictactoe_app/features/game/domain/usecases/bot_move_usecase.dart';
import 'package:tictactoe_app/features/game/domain/usecases/check_winner_usecase.dart';
import 'package:tictactoe_app/features/game/domain/usecases/make_move_usecase.dart';
import 'package:tictactoe_app/features/game/presentation/bloc/game_event.dart';
import 'package:tictactoe_app/features/game/presentation/bloc/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final MakeMoveUsecase makeMoveUseCase;
  final CheckWinnerUsecase checkWinnerUseCase;
  final BotMoveUsecase botMoveUseCase;

  GameBloc({
    required this.botMoveUseCase,
    required this.checkWinnerUseCase,
    required this.makeMoveUseCase,
  }) : super(GameState.initial()) {
    on<PlayerMoved>(_onPlayerMoved);
    on<GameReset>(_onGameReset);
  }

  _onPlayerMoved(PlayerMoved event, Emitter<GameState> emit) {
    var stateMove = makeMoveUseCase.call(
      state: state.entity,
      index: event.index,
    );

    var winner = checkWinnerUseCase.call(board: stateMove.board);

    emit(
      GameState(
        entity: GameStateEntity(
          board: stateMove.board,
          currentPlayer: stateMove.currentPlayer,
          isGameOver: winner != null ? true : false,
          winner: winner,
        ),
      ),
    );
    if (stateMove.winner == null) {
      botMoveUseCase.call(stateMove.board);
    }
  }

  _onGameReset(GameReset event, Emitter<GameState> emit) {
    emit(GameState.initial());
  }
}
