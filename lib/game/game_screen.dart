import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_shooter/common/background.dart';
import 'package:flutter_space_shooter/game/bullet.dart';
import 'package:flutter_space_shooter/game/enemy.dart';
import 'package:flutter_space_shooter/game/explosion.dart';
import 'package:flutter_space_shooter/game/player.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class GameScreen extends Component
    with HasGameRef<GameManager>, HasCollisionDetection {
  static const int stepLevel = 10;
  late Player _player;
  late TextComponent _playerScore;
  late Timer enemySpawner;
  late Timer bulletSpawner;
  int score = 0;

  @override
  Future<void>? onLoad() {
    enemySpawner = Timer(2, onTick: _spawnEnemy, repeat: true);
    bulletSpawner = Timer(1, onTick: _spawnBullet, repeat: true);

    add(Background(30));

    _playerScore = TextComponent(
      text: "Score : 0",
      position: Vector2(gameRef.size.toRect().width / 2, 10),
      anchor: Anchor.topCenter,
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 48,
        ),
      ),
    );
    add(_playerScore);

    _player = Player(_onPlayerTouch);
    add(_player);
    return null;
  }

  void _spawnEnemy() {
    for (int i = 0; i <= min(score ~/ stepLevel, 2); i++) {
      add(Enemy(_onEnemyTouch));
    }
  }

  void _spawnBullet() {
    var bullet = Bullet();
    bullet.position = _player.position.clone();
    add(bullet);
  }

  void _onPlayerTouch() {
    gameRef.endGame(score);
  }

  void _onEnemyTouch(Vector2 position) {
    var explosion = Explosion();
    explosion.position = position;
    add(explosion);
    score++;
    _playerScore.text = "Score : $score";

    if (score % stepLevel == 0) {
      bulletSpawner.stop();
      bulletSpawner = Timer(min(1 / (score ~/ stepLevel), 1).toDouble(),
          onTick: _spawnBullet, repeat: true);
    }
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
    bulletSpawner.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    enemySpawner.update(dt);
    bulletSpawner.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();
    enemySpawner.stop();
    bulletSpawner.stop();
  }
}
