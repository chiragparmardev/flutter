import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PlayStore extends StatefulWidget {
  const PlayStore({super.key});



  @override
  State<PlayStore> createState() => _PlayStoreState();
}

class _PlayStoreState extends State<PlayStore> {


  final List<String> imgList = [
    'https://cdn.educba.com/academy/wp-content/uploads/2020/04/React-Native-Slider.jpg',
    'https://i.ytimg.com/vi/9LtjonxMwIA/maxresdefault.jpg',
    'https://shopney.co/blog/content/images/2019/10/opt_mobile-app-banner.png',
    'https://cdn.shopify.com/app-store/listing_images/50bb43331da42651a316f787225367a6/mobile_screenshot/CNikocylqYADEAE=.png?height=720&width=1280',
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Feature Appas',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: CarouselSlider(
                items: imgList.map((item) {
                  return Image.network(
                    item,
                    fit: BoxFit.fill,
                  );
                }).toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        SizedBox(
          height: 5,
        ),
        Text('Best New Apps',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              UiHelper.app('https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg', 'Disney Build In :Forezen', 'Game',3.99),
              SizedBox(
                width: 10,
              ),
              UiHelper.app('https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg', 'Disney Build In :Forezen', 'Game',null),
              SizedBox(
                width: 10,
              ),
              UiHelper.app('https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg', 'Disney Build In :Forezen', 'Game',null),
              SizedBox(
                width: 10,
              ),
              UiHelper.app('https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg', 'Disney Build In :Forezen', 'Game',null),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              UiHelper.app('https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg', 'Disney Build In :Forezen', 'Game',3.99),
              SizedBox(
                width: 10,
              ),
              UiHelper.app('https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg', 'Disney Build In :Forezen', 'Game',null),
              SizedBox(
                width: 10,
              ),
              UiHelper.app('https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg', 'Disney Build In :Forezen', 'Game',null),
              SizedBox(
                width: 10,
              ),
              UiHelper.app('https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg', 'Disney Build In :Forezen', 'Game',null),
            ],
          ),
        ),

            ],
          ),
        ),
        
        
          ],
        ),
      ),
    );
  }
}


class UiHelper{
  static app(String img,String title,String subtitle, double? price){
    return Container(
      width: 120,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover
              )  ,
              borderRadius: BorderRadius.circular(12)
            ),
            ),
          SizedBox(
            height: 10,
          ),
          Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          SizedBox(
            height: 2,
          ),
          Text(subtitle,style: TextStyle(fontSize: 17,color: Colors.grey),),
          SizedBox(
            height: 2,
          ),
          price == null ? Text(
            ''
          ):
          Text('\$ $price ',style: TextStyle(fontSize: 17,color: Colors.grey[700],fontWeight: FontWeight.w600),),

        ],
      ),
    );
  }
}