import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {}

class PlayerMoved extends GameEvent {
  final int index;

  PlayerMoved({required this.index});

  @override
  List<Object?> get props => [index];
}

class GameReset extends GameEvent {
  @override
  List<Object?> get props => [];
}
