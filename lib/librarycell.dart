
import 'package:flutter/cupertino.dart';
import 'package:testapp/game.dart';
class Librarycell extends StatelessWidget{
   Game game;
  Librarycell(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(game.image, width: 250),
          Text(game.name, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  
}