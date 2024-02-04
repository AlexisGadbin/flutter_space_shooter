import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_space_shooter/common/background.dart';
import 'package:flutter_space_shooter/game_manager.dart';
import 'package:flutter_space_shooter/main/start_text.dart';

class MainScreen extends Component with HasGameRef<GameManager> {
  final Function _onStartClicked;

  MainScreen(this._onStartClicked);

  @override
  Future<void>? onLoad() async {
    add(Background(30));
    add(StartText());
  }

  void onPanStart(DragStartInfo info) {
    if (isMounted) _onStartClicked();
  }
}
