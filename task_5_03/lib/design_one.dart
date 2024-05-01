import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product {
  final String imgUrl;
  final String title;
  final String subTitle;
  final String min;

  Product(this.imgUrl, this.title, this.subTitle, this.min);
}

class DesignOne extends StatefulWidget {
  const DesignOne({super.key});

  @override
  State<DesignOne> createState() => _DesignOneState();
}

class _DesignOneState extends State<DesignOne> {
  List<Product> productList = [
    Product(
        'https://imgupscaler.com/images/samples/animal-before.webp',
        'Pasta with tomato sauce',
        'Classic Italian pasta with tomato sauce',
        '30 mins'),
    Product(
        'https://imgupscaler.com/images/samples/animal-before.webp',
        'Pasta with tomato sauce',
        'Classic Italian pasta with tomato sauce',
        '30 mins'),
    Product(
        'https://imgupscaler.com/images/samples/animal-before.webp',
        'Pasta with tomato sauce',
        'Classic Italian pasta with tomato sauce',
        '30 mins'),
    Product(
        'https://imgupscaler.com/images/samples/animal-before.webp',
        'Pasta with tomato sauce',
        'Classic Italian pasta with tomato sauce',
        '30 mins'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Receipe App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(productList.length, (index) {
            return CustomCardOne(
                imgUrl: productList[index].imgUrl,
                title: productList[index].title,
                subTitle: productList[index].subTitle,
                min: productList[index].min);
          }),
        ),
      ),
    );
  }
}

class CustomCardOne extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subTitle;
  final String min;
  const CustomCardOne(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.subTitle,
      required this.min});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2.r,
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            imgUrl,
            width: 100.w,
            height: 100.h,
            fit: BoxFit.fill,
            loadingBuilder:
                (BuildContext context, Widget child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                width: 100.w,
                height: 100.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700,color: Colors.black),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    const Icon(Icons.timer_sharp),
                    Text(
                      min,
                      style: TextStyle(color: Colors.grey.shade800),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
