import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  ScreenTwo({super.key, required this.index});
  int index;

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  bool isMarked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Sea ${widget.index + 1}"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(children: [
        Image.network(
            'https://www.omfif.org/wp-content/uploads/2022/10/ocean-economy-newweb.png'),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Ocean view for sea ${widget.index + 1}",
          style: const TextStyle(fontSize: 20),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
          final snackbar = SnackBar(
              content: Text("Sea ${widget.index + 1} is marked as favourites"));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            isMarked = !isMarked;
          });
        },
        child: Icon(
          Icons.favorite_border,
          color: isMarked ? Colors.red : Colors.white,
        ),
      ),
    ));
  }
}
