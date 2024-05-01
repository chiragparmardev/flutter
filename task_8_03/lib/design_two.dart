import 'package:flutter/material.dart';

class DesignTwo extends StatelessWidget {
  const DesignTwo({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const One(),
      const Two(),
      const Three(),
      const Four()
    ];
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: widgets,
      ),
    );
  }
}

class One extends StatelessWidget {
  const One({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade800,
      child: const Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.home,
                size: 150,
                color: Colors.white,
              )),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'FLutter TransformerPageView, for welcome screen, banner, image catalog and more',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Two extends StatelessWidget {
  const Two({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade600,
      child: const Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.thumb_up,
                size: 150,
                color: Colors.white,
              )),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Simple to us',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Simple api, easy to understand, powerful adn strong',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Three extends StatelessWidget {
  const Three({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade800,
      child: const Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.photo_size_select_actual_outlined,
                size: 150,
                color: Colors.white,
              )),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Easy parallax',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Create parallax by a few lines of code',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Four extends StatelessWidget {
  const Four({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade800,
      child: const Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.edit,
                size: 150,
                color: Colors.white,
              )),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Customizable',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Highly customizable, the only boundary is our mind. ☺',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
