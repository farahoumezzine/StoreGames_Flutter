import 'package:flutter/material.dart';
import 'package:testapp/game.dart';
import 'package:testapp/librarycell.dart';

class Library extends StatelessWidget {
  var games = [
    Librarycell(Game("lib/assets/fortnite.jpg", "Fortnite", 500)),
    Librarycell(Game("lib/assets/Fifa.jpg", "Fifa", 250)),
    Librarycell(Game("lib/assets/league.jpg", "Lol", 600)),
    Librarycell(Game("lib/assets/mario.jpg", "Super Mario", 150)),
    Librarycell(Game("lib/assets/gta.jpg", "Gta", 700)),
    Librarycell(Game("lib/assets/maincraft.jpg", "maincraft", 300)),
  ];
  Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text("Gstore ESPRIM", style: TextStyle(color: Colors.white)),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Librarycell(games[index].game);
        },
      ),
    );
  }
}
