import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

void main() => runApp(const MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});

  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();

    tiles = [
      StatefulColorfulTile(key: UniqueKey()),
      StatefulColorfulTile(key: UniqueKey()),
      StatelessColorfulTile(),
      StatelessColorfulTile(),
      //StatefulColorfulTile(),
      //StatefulColorfulTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //print("position tiled state");
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.sentiment_very_satisfied),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(0, tiles.removeAt(1));
      tiles.insert(2, tiles.removeAt(3));
      print("swap");
    });
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({super.key});
  @override
  State<StatefulWidget> createState() => StatefulColorfulTileState();
}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color myColor = RandomColor.getColorObject(Options());

  @override
  Widget build(BuildContext context) {
    print("nur einmal pro Kasten");
    return Expanded(
      child: Container(
        height: 150,
        width: 150,
        color: myColor,
      ),
    );
  }
}

class StatelessColorfulTile extends StatelessWidget {
  final Color myColor = RandomColor.getColorObject(Options());

  StatelessColorfulTile({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        width: 150,
        color: myColor,
      ),
    );
  }
}
