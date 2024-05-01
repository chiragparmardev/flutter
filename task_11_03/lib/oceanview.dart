import 'package:flutter/material.dart';
import 'package:task_11_03/screentwo.dart';

class OceanView extends StatelessWidget {
  const OceanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Un-Named Routes"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              borderOnForeground: false,
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenTwo(
                            index: index,
                          ),
                        ));
                  },
                  title: Text('Sea ${index + 1}'),
                  subtitle: Text("Ocean view for sea ${index + 1}"),
                  minVerticalPadding: 10,
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.thoughtco.com/thmb/g8h6NnWWWVkm-KXNBgMx-0Edd2U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages_482194715-56a1329e5f9b58b7d0bcf666.jpg'),
                  )),
            );
          },
        ),
      ),
    );
  }
}
