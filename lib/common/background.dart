import 'package:flame/components.dart';
import 'package:flutter_space_shooter/common/star.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class Background extends Component with HasGameRef<GameManager> {
  int nbStars;

  Background(this.nbStars);

  @override
  Future<void>? onLoad() async {
    for (var i = 0; i < nbStars; i++) {
      add(Star());
    }
  }
}
