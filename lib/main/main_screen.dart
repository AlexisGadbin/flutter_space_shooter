import 'package:flame/components.dart';
import 'package:flutter_space_shooter/common/background.dart';
import 'package:flutter_space_shooter/game_manager.dart';

class MainScreen extends Component with HasGameRef<GameManager> {
  @override
  Future<void>? onLoad() async {
    add(Background(30));
  }
}
