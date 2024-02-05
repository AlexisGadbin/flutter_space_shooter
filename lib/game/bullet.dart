import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_space_shooter/game/enemy.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class Bullet extends SpriteComponent
    with HasGameRef<GameManager>, CollisionCallbacks {
  final double _speed = 450;

  @override
  FutureOr<void> onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
    width = 32;
    height = 16;

    anchor = Anchor.center;

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(0, -1) * _speed * dt;

    if (position.y < 0) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      removeFromParent();
    }
  }
}
