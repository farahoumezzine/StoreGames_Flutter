import 'package:flutter/material.dart';
import 'package:testapp/game.dart';
import 'package:testapp/details.dart';
class Gamecell extends StatelessWidget {
  Game game;
  Gamecell(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(game)),
        );
      },

    child: Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: [
          Image.asset(game.image, width: 250),
          Column(
            children: [
              Text(game.name, style: TextStyle(fontSize: 16)),
              Text(
                "${game.price} TND",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    ),
    );

  }
}
