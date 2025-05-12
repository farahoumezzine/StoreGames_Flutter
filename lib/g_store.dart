import 'package:flutter/material.dart';
import 'package:testapp/game.dart';
import 'package:testapp/gamecell.dart';

class GStore extends StatelessWidget {
 const GStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
          "Gstore ESPRIM",
          style: TextStyle(color: Colors.white),
          ),
      ),
          body :SingleChildScrollView(
            child: Column( children: [
              Gamecell(Game("lib/assets/fortnite.jpg", "Fortnite", 500)),
              Gamecell(Game("lib/assets/Fifa.jpg", "Fifa", 250)),
              Gamecell(Game("lib/assets/league.jpg", "Lol", 600)),
              Gamecell(Game("lib/assets/mario.jpg", "Super Mario", 150)),
              Gamecell(Game("lib/assets/gta.jpg", "Gta", 700)),

            ], ),
           
          )
    );
  
  }
}
