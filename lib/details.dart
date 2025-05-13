import 'package:flutter/material.dart';
import 'package:testapp/game.dart';

class Details extends StatefulWidget {
  Game game;
  Details(this.game, {super.key});

  @override
  State<Details> createState() {
    return _DetailsState();
  }
}

class _DetailsState extends State<Details> {
  var quantity = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(widget.game.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Image.asset(widget.game.image, width: 250),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text(
                  "${widget.game.price} TND",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Text("Quantity : $quantity"),
            /*ElevatedButton(
              child: Text('Acheter'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[50]),
              onPressed: () {setState(() {
                  quantity--;
                });},
              
            ),*/
             ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  quantity--;
                });
              },
              icon: Icon(Icons.shopping_basket),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[50]),
              label: Text("Acheter"),
            ),
          ],
        ),
      ),
    );
  }
}
