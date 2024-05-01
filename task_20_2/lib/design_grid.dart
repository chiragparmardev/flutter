import 'package:flutter/material.dart';

class Items{
  final IconData icon;
  final String title;
  final Color color;

  Items(this.icon,this.title,this.color);
}

List<Items> item = <Items>[
  Items(Icons.bike_scooter, 'Bicycle', const Color(0xffe7f1fa)),
  Items(Icons.directions_boat, 'Boat', const Color(0xff2b8b31)),
  Items(Icons.bus_alert, 'Bus', const Color(0xff7f7deb)),
  Items(Icons.train, 'Train', const Color(0xffd3e38a)),
  Items(Icons.assist_walker, 'Walk', const Color(0xffddd6c3)),
  Items(Icons.contact_emergency, 'Contact', const Color(0xfff6d8fa)),
  Items(Icons.bike_scooter, 'Bicycle', const Color(0xfff8f8f8)),
  Items(Icons.directions_boat, 'Boat', const Color(0xfff8f8f8)),
  Items(Icons.bus_alert, 'Bus', const Color(0xffc2f2b8)),
  Items(Icons.train, 'Train', const Color(0xfff3d7d4)),
  Items(Icons.assist_walker, 'Walk', const Color(0xffe68ffa)),
  Items(Icons.contact_emergency, 'Contact', const Color(0xffd5addf)),
];

List<Items> item2 = <Items>[
  Items(Icons.home, 'Home', const Color(0xff7fba99)),
  Items(Icons.email, 'Email', const Color(0xffd372aa)),
  Items(Icons.alarm, 'Alarm', const Color(0xffaf7cb0)),
  Items(Icons.wallet, 'Wallet', const Color(0xffb05279)),
  Items(Icons.backup, 'Backup', const Color(0xffb3bab0)),
  Items(Icons.book, 'Book', const Color(0xff503177)),
  Items(Icons.camera, 'Camera', const Color(0xffb1c651)),
  Items(Icons.person, 'Person', const Color(0xff896136)),
  Items(Icons.print, 'Print', const Color(0xffaeb99d)),
  Items(Icons.phone, 'Phone', const Color(0xff93e85d)),
  Items(Icons.note, 'Note', const Color(0xff6a25b8)),
  Items(Icons.music_note, 'Music', const Color(0xffb14f89)),
  Items(Icons.car_rental, 'car', const Color(0xffc0b893)),
  Items(Icons.bike_scooter, 'Bicycle', const Color(0xff6a25b8)),
  Items(Icons.directions_boat, 'Boat', const Color(0xffc4d48b)),
];

class DesignGrid extends StatelessWidget {
  const DesignGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Grid Demo',
        style: TextStyle(fontSize: 20)),
      bottom: const TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            text: 'GridViewCount',
          ),
          Tab(text: 'GridViewBuilder'),
          Tab(text: 'GridViewExtend'),
        ],
      ),
      ),
    body: const Padding(
    padding: EdgeInsets.only(left: 10, right: 15),
    child: TabBarView(
    children: [
      GridViewCount(),
      GridViewBuilderIconText(),
      GridViewExtend()
    ]
    )
    ),
    ));

  }
}


class GridViewBuilderIconText extends StatelessWidget {
  const GridViewBuilderIconText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.0
               ),
            shrinkWrap: true,
            itemCount: item.length,
               itemBuilder: (BuildContext context, int index){
                return Container(
                  color: item[index].color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(item[index].icon,size: 30,),
                      Text(item[index].title,style: const TextStyle(fontSize: 20),)
                    ],
                  ),
                );
               } ),
        ],
      ),
    );
  }
}


class GridViewCount extends StatelessWidget {
  const GridViewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children:  List.generate(25, (index) {
              return Container(
                color: index % 2 == 0 ? const Color(0xff00b241) : const Color(0xffffeb00),
                child:  Center(
                  child: Text(index.toString(),style: const TextStyle(fontSize: 25),),
                ),
              );
            }
            ) ,
          ),
        ),
      ],
    ));
  }
}


class GridViewExtend extends StatelessWidget {
  const GridViewExtend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        primary: false,
        padding: const EdgeInsets.only(top: 10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
        maxCrossAxisExtent: 150.0,
          children: List.generate(item2.length, (index) {
            return Container(
              color: item2[index].color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(item2[index].icon),
                  Text(item2[index].title)
                ],
              ),
            );
                 
          }
          )

      )

      ,
    );
  }
}


