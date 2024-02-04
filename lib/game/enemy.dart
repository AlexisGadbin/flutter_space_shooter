import 'dart:math';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class Enemy extends SpriteAnimationComponent with HasGameRef<GameManager> {
  final double _speed = 200;

  final VoidCallback onTouch;

  Enemy(this.onTouch);

  @override
  Future<void>? onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('enemy.png'), srcSize: Vector2(16, 16));

    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.2);

    var size = 40.0;
    position = Vector2(
        Random()
            .nextInt((gameRef.size.toRect().width - size).toInt())
            .toDouble(),
        size);
    width = size;
    height = size;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(0, 1) * _speed * dt;
    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }
}
