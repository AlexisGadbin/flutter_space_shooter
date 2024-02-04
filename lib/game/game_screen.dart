import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_space_shooter/common/background.dart';
import 'package:flutter_space_shooter/game/enemy.dart';
import 'package:flutter_space_shooter/game/player.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class GameScreen extends Component with HasGameRef<GameManager> {
  static const int stepLevel = 20;
  late Player _player;
  late Timer enemySpawner;
  int score = 0;

  @override
  Future<void>? onLoad() {
    enemySpawner = Timer(2, onTick: _spawnEnemy, repeat: true);

    add(Background(30));
    _player = Player(_onPlayerTouch);
    add(_player);
    add(Enemy(() {}));
    return null;
  }

  void _spawnEnemy() {
    for (int i = 0; i <= min(score ~/ stepLevel, 2); i++) {
      add(Enemy(_onEnemyTouch));
    }
  }

  void _onPlayerTouch() {
    // Handle player touch
  }

  void _onEnemyTouch() {
    // Handle enemy touch
  }

  void onPanUpdate(DragUpdateInfo info) {
    if (isMounted) {
      _player.move(info.delta.global);
    }
  }

  @override
  void onMount() {
    super.onMount();
    enemySpawner.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    enemySpawner.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();
    enemySpawner.stop();
  }
}
