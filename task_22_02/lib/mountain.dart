import 'package:flutter/material.dart';

class MountainPage extends StatelessWidget {
  const MountainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://shepherdtraveller.com/wp-content/uploads/2021/04/oeschinensee-camping-Lakes-in-Switzerland-1024x683.jpg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          const ListTile(
            title: Text(
              'Oeschinen Lake Campground',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Kandersteg, Switzerland',
              style: TextStyle(fontSize: 18),
            ),
            trailing: SizedBox(
              width: 50,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.red,
                  ),
                  Text(
                    '41',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.call,
                      size: 30,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'CALL',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'SEND',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share,
                      size: 30,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'SHARE',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "A mountain is an elevated portion of the Earth's crust, generally with steep sides that show significant exposed bedrock. Although definitions vary, a mountain may differ from a plateau in having a limited summit area, and is usually higher than a hill, typically rising at least 300 metres above the surrounding land.",
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
