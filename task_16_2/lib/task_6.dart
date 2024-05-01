// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Products {
  String image;
  String title;
  String subtitle;
  String date;

  Products(
      {required this.date,
      required this.image,
      required this.subtitle,
      required this.title});
}

class ListAllPage extends StatefulWidget {
  const ListAllPage({super.key});

  @override
  State<ListAllPage> createState() => _ListAllPageState();
}

class _ListAllPageState extends State<ListAllPage> {
  List<Products> productDetails = [
    Products(
        date: '8, may 2026',
        image: 'assets/images/1.jpg',
        subtitle: 'Collection of high resolutions of photo',
        title: 'Kwics'),
    Products(
        date: '9, may 2026',
        image: 'assets/images/1.jpg',
        subtitle: 'Collection of high resolutions of photo',
        title: 'Lemons'),
    Products(
        date: '10, may 2026',
        image: 'assets/images/1.jpg',
        subtitle: 'Collection of high resolutions of photo',
        title: 'Figs'),
    Products(
        date: '11, may 2026',
        image: 'assets/images/1.jpg',
        subtitle: 'Collection of high resolutions of photo',
        title: 'Watermalons'),
    Products(
        date: '12, may 2026',
        image: 'assets/images/1.jpg',
        subtitle: 'Collection of high resolutions of photo',
        title: 'Starwberries'),
  ];

  List<String> networkImage = [
    'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?cs=srgb&dl=pexels-ella-olsson-1640772.jpg&fm=jpg',
    'https://media.istockphoto.com/id/1403973419/photo/table-top-of-food-spread-on-table.jpg?s=612x612&w=0&k=20&c=2cROUMurZUtuvqF-bp8lViZ0wDXBNkZBcIjQj2QQlec=',
    'https://t4.ftcdn.net/jpg/00/49/38/95/360_F_49389597_6VboA8kRehV5naoKBLlvdeyf3Y8vclSZ.jpg',
    'https://img.etimg.com/thumb/width-640,height-480,imgsize-361708,resizemode-75,msid-102950014/news/india/unhealthy-foods-gaining-traction-post-covid-who-icrier-study/unhealthy-foods.jpg',
    'https://t4.ftcdn.net/jpg/02/86/17/89/360_F_286178925_8zk89O9uC5JJVPvqhvBMUpaRxp8AFXzD.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[900],
        title: Text(
          "Photo Shoots",
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(Icons.menu),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert_rounded),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: productDetails.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final currentProduct = productDetails[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(
                            imageUrl: networkImage[index],
                            title: currentProduct.title,
                          )));
            },
            leading: Image.asset(currentProduct.image),
            title: Text(currentProduct.title),
            subtitle: Text(currentProduct.subtitle),
            trailing: Column(
              children: [
                Text(currentProduct.date),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  const ProductDetailsPage(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          Icon(Icons.more_vert_rounded),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2.13,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2.13,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
