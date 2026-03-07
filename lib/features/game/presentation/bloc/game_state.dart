import 'package:equatable/equatable.dart';
import 'package:tictactoe_app/features/game/domain/entities/game_state_entity.dart';

class GameState extends Equatable {
  final GameStateEntity entity;

  GameState({required this.entity});

  @override
  List<Object?> get props => [entity];

  factory GameState.initial() {
    return GameState(entity: GameStateEntity.initial());
  }
}
