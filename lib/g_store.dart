import 'package:flutter/material.dart';
import 'package:testapp/game.dart';
import 'package:testapp/gamecell.dart';
import 'package:testapp/modifier_profile.dart';

class GStore extends StatelessWidget {
  final String username;
  var games = [
    Gamecell(Game("lib/assets/fortnite.jpg", "Fortnite", 500)),
    Gamecell(Game("lib/assets/Fifa.jpg", "Fifa", 250)),
    Gamecell(Game("lib/assets/league.jpg", "Lol", 600)),
    Gamecell(Game("lib/assets/mario.jpg", "Super Mario", 150)),
    Gamecell(Game("lib/assets/gta.jpg", "Gta", 700)),
    Gamecell(Game("lib/assets/maincraft.jpg", "maincraft", 300)),
  ];

  GStore({Key? key, required this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
          "Hello, $username - Gstore ESPRIM",
          style: TextStyle(color: Colors.white),
        ),
        //automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[400]),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                // Handle home navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ModifierProfile(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                // Handle settings navigation
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
              onTap: () {
                // Handle logout
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return games[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Default selected index
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'Library',
          ),
        ],
        selectedItemColor: Colors.blue[400],
        onTap: (int index) {
          // Handle navigation based on index
          switch (index) {
            case 0:
              // Home action
              Navigator.pushNamed(context, '/gstore');
              break;
            case 1:
              Navigator.pushNamed(context, '/library');
              break;
          }
        },
      ),
    );
  }
}
