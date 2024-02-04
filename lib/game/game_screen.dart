import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_space_shooter/common/background.dart';
import 'package:flutter_space_shooter/game/player.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class GameScreen extends Component with HasGameRef<GameManager> {
  late Player _player;

  @override
  Future<void>? onLoad() {
    add(Background(30));
    _player = Player(_onPlayerTouch);
    add(_player);
    return null;
  }

  void _onPlayerTouch() {
    // Handle player touch
  }

  void onPanUpdate(DragUpdateInfo info) {
    if (isMounted) {
      _player.move(info.delta.global);
    }
  }
}
