import 'package:equatable/equatable.dart';

class GameStateEntity extends Equatable {
  final List<String> board;
  final String currentPlayer;
  final String? winner;
  final bool isGameOver;

  @override
  List<Object?> get props => [board, currentPlayer, winner, isGameOver];

  GameStateEntity({
    required this.board,
    required this.currentPlayer,
    this.winner,
    required this.isGameOver,
  });

  factory GameStateEntity.initial() {
    return GameStateEntity(
      board: ['', '', '', '', '', '', '', '', ''],
      currentPlayer: "X",
      isGameOver: false,
      winner: null,
    );
  }
}
