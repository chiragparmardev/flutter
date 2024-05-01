import 'package:flutter/material.dart';

class ButtonsGradient extends StatelessWidget {
  const ButtonsGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Popupmenu with Button'),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text(
                  "Mark as read",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text(
                  "Mute Notification",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            offset: const Offset(0, 50),
            color: Colors.white,
            elevation: 2,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30)
                ),
                clipBehavior: Clip.hardEdge,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                        onTap: (){},
                        child: const Center(child: Text('Rounded Fill Material button',style: TextStyle(color: Colors.white,fontSize: 20),))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.blue,
                        Colors.green,
                      ],
                    )

                ),
                clipBehavior: Clip.hardEdge,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: (){},
                        child: const Center(child: Text('Rounded Fill Material button',style: TextStyle(color: Colors.white,fontSize: 20),))),
                  ),
                ),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50)
              ),
              clipBehavior: Clip.hardEdge,
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                      onTap: (){},
                      child: const Icon(Icons.download,color: Colors.white,)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(onPressed: (){},child: const SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Download'),
                ],
              ),
            ),),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                    width: 2,
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
              clipBehavior: Clip.hardEdge,
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                      onTap: (){},
                      child: const Icon(Icons.share,color: Colors.white,)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.message))
          ],
        ),
      ),
    );
  }
}
