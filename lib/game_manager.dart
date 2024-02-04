import 'package:flame/game.dart';
import 'package:flutter_space_shooter/game/game_screen.dart';
import 'package:flutter_space_shooter/main/main_screen.dart';

class GameManager extends FlameGame {
  late GameScreen _gameScreen;
  late MainScreen _mainScreen;

  GameManager() {
    _gameScreen = GameScreen();
    _mainScreen = MainScreen();
  }

  @override
  Future<void>? onLoad() {
    add(_mainScreen);
    return null;
  }
}
