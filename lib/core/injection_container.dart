import 'package:get_it/get_it.dart';
import 'package:tictactoe_app/features/game/domain/usecases/bot_move_usecase.dart';
import 'package:tictactoe_app/features/game/domain/usecases/check_winner_usecase.dart';
import 'package:tictactoe_app/features/game/domain/usecases/make_move_usecase.dart';
import 'package:tictactoe_app/features/game/presentation/bloc/game_bloc.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton(() => MakeMoveUsecase());
  getIt.registerLazySingleton(() => CheckWinnerUsecase());
  getIt.registerLazySingleton(() => BotMoveUsecase());

  getIt.registerFactory(
    () => GameBloc(
      botMoveUseCase: getIt(),
      checkWinnerUseCase: getIt(),
      makeMoveUseCase: getIt(),
    ),
  );
}
