import 'package:flame/components.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class StartText extends SpriteComponent with HasGameRef<GameManager> {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load('start.png');
    anchor = Anchor.center;
    position = gameRef.size / 2;

    var originalSize = sprite?.originalSize;
    if (originalSize == null) return;
    var height = gameRef.size.toSize().height / 5;
    var width =
        originalSize.toSize().width * (height / originalSize.toSize().height);
    size = Vector2(width, height);
  }
}
