import 'package:flutter/material.dart';

class DesignOne extends StatelessWidget {
  const DesignOne({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double safeAreaTopHeight = MediaQuery.of(context).padding.top;
    double safeAreaBottomHeight = MediaQuery.of(context).padding.bottom;
    double safeAreaTopBottom = safeAreaTopHeight + safeAreaBottomHeight;
    double appBarHeight = AppBar().preferredSize.height;
    double topPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double usableHeight =
        screenHeight - topPadding - bottomPadding - appBarHeight;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuery'),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'Screen Height : $screenHeight\n'
            'Screen Width : $screenWidth\n'
            'SafeArea Top : $safeAreaTopHeight\n'
            'SafeArea Bottom :$safeAreaBottomHeight\n'
            'SafeArea Top & Bottom : $safeAreaTopBottom\n'
            'Appbar Height : $appBarHeight\n'
            'Top Padding : $topPadding\n'
            'Bottom Padding : $bottomPadding\n'
            'Usable Screen Height : $usableHeight\n',
            style: const TextStyle(fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
