import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_shooter/common/background.dart';
import 'package:flutter_space_shooter/game_manager.dart';
import 'package:flutter_space_shooter/main/start_text.dart';

class MainScreen extends Component with HasGameRef<GameManager> {
  final Function _onStartClicked;
  late TextComponent _playerScore;

  MainScreen(this._onStartClicked);

  @override
  Future<void>? onLoad() async {
    add(Background(30));
    add(StartText());

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
  }

  void onPanStart(DragStartInfo info) {
    if (isMounted) _onStartClicked();
  }

  void setScore(int score) {
    _playerScore.text = "Score : $score";
  }
}
