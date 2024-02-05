import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_shooter/game/enemy.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<GameManager>, CollisionCallbacks {
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

    add(RectangleHitbox());
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      onTouch.call();
    }
  }
}
