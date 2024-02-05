import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class Explosion extends SpriteAnimationComponent with HasGameRef<GameManager> {
  @override
  Future<void>? onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('explosion.png'), srcSize: Vector2(32, 32));

    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.1, loop: false);

    width = 40;
    height = 40;
    removeOnFinish = true;
    anchor = Anchor.center;
  }
}
