import 'package:flame/position.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/animation.dart' as animation;
import 'package:flame/sprite.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/widgets/animation_widget.dart';

const COLOR = const Color(0xFFFF8C75);
Sprite _sprite;
animation.Animation _animation;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _sprite = await Sprite.loadSprite('minotaur.png', width: 96, height: 96);

  await Flame.images.load('minotaur.png');
  final _animationSpriteSheet = SpriteSheet(
    imageName: 'minotaur.png',
    columns: 19,
    rows: 1,
    textureWidth: 96,
    textureHeight: 96,
  );
  _animation = _animationSpriteSheet.createAnimation(
    0,
    // time between frames
    stepTime: 0.4,
    to: 19,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/castle.png'), fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200.0,
              width: 200.0,
                child: AnimationWidget(animation: _animation),
            ),
          ),
        ),
    );


  }
}

