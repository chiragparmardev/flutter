import 'package:flutter/material.dart';

class TwoHome extends StatelessWidget {
  const TwoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo.jpeg",
          height: 70,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) => const ListCustom()),
        ),
      ),
    );
  }
}

class ListCustom extends StatelessWidget {
  const ListCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    color: Colors.purple,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1607462109225-6b64ae2dd3cb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhbWVyYXxlbnwwfHwwfHx8MA%3D%3D'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nikon 600D Microless',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '\$344.999',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.purple.shade700),
                  ),
                  const Spacer(),
                  Wrap(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Align(
                          widthFactor: 0.5,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundImage:
                                NetworkImage("https://picsum.photos/${i}00"),
                          ),
                        ),
                      const Text(
                        "\t\t +201 recommendation",
                        style: TextStyle(
                            fontStyle: FontStyle.normal, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
