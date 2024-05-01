import 'package:flutter/material.dart';
import 'package:task_8_03/pageview1.dart';
import 'package:task_8_03/pageview2.dart';
import 'package:task_8_03/pageview3.dart';

class DesignOne extends StatefulWidget {
  const DesignOne({Key? key}) : super(key: key);

  @override
  State<DesignOne> createState() => _DesignOneState();
}

class _DesignOneState extends State<DesignOne> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const PageOne(),
      const PageTwo(),
      const PageThree(),
      PageViewOne(),
      PageViewTwo(),
      PageViewThree(),
    ];

    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const BouncingScrollPhysics(),
          children: widgets,
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Page 1',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    color: Colors.blue,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    height: 50,
                    color: Colors.blue,
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Page 2',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ))),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Page 3',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ))),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
