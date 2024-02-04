import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class Player extends SpriteAnimationComponent with HasGameRef<GameManager> {
  final VoidCallback onTouch;

  Player(this.onTouch);

  @override
  Future<void>? onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('player.png'), srcSize: Vector2(32, 48));

    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.2);

    position = gameRef.size / 2;
    width = 80;
    height = 120;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
