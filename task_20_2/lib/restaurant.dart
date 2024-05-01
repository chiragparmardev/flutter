import 'package:flutter/material.dart';

class storyClass{
  final String Image;
  final String title;

  storyClass(this.Image,this.title);
}

List<storyClass> stories = [
  storyClass('https://www.southernliving.com/thmb/DwsVp7xH_SCCIBBbLTPbVBzOhfk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2678201_HIHAn_27538-2000-47842017c4a9440ea1c615cc941c42f2.jpg', 'Soup'),
  storyClass('https://www.southernliving.com/thmb/DwsVp7xH_SCCIBBbLTPbVBzOhfk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2678201_HIHAn_27538-2000-47842017c4a9440ea1c615cc941c42f2.jpg', 'Candies'),
  storyClass('https://www.southernliving.com/thmb/DwsVp7xH_SCCIBBbLTPbVBzOhfk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2678201_HIHAn_27538-2000-47842017c4a9440ea1c615cc941c42f2.jpg', 'Salad'),
  storyClass('https://www.southernliving.com/thmb/DwsVp7xH_SCCIBBbLTPbVBzOhfk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2678201_HIHAn_27538-2000-47842017c4a9440ea1c615cc941c42f2.jpg', 'Appetizer'),
  storyClass('https://www.southernliving.com/thmb/DwsVp7xH_SCCIBBbLTPbVBzOhfk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2678201_HIHAn_27538-2000-47842017c4a9440ea1c615cc941c42f2.jpg', 'Dabeli'),
  storyClass('https://www.southernliving.com/thmb/DwsVp7xH_SCCIBBbLTPbVBzOhfk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2678201_HIHAn_27538-2000-47842017c4a9440ea1c615cc941c42f2.jpg', 'Punjabi')
];

List<storyClass> productItem = [
  storyClass('https://www.foodiesfeed.com/wp-content/uploads/2023/09/healthy-food.jpg', 'Soup is a primarily liquid food, generally served warm or hot (but may be cool or cold), that is made by combining ingredients of meat or vegetables with stock, milk, or water.'),
  storyClass('https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg', 'Food is any substance consumed by an organism for nutritional support. Food is usually of plant, animal, or fungal origin and contains essential nutrients such as carbohydrates, fats, proteins, vitamins, or minerals.')
];

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9e9e9e),
      appBar: AppBar(
        elevation: 3,
        shadowColor: const Color(0xff898989),
        backgroundColor: const Color(0xff9e9e9e),
        title: const Text('Restaurant Menu',style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.white,))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 140,
            child: ListView.builder(
              shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stories.length
            ,itemBuilder: (BuildContext context , index){
              return Story(title: stories[index].title, img: stories[index].Image,);
            }),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: productItem.length
            ,itemBuilder:(BuildContext context , index){
              return UiHelper.Product(productItem[index].Image, productItem[index].title);
            }),
          ), 

        ],
      ),
    );
  }
}

class Story extends StatelessWidget {
  final String img;
  final String title;
  const Story({super.key,required this.title,required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(img)
                ),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    width: 1,
                    color: Colors.black
                )

            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(title,style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}

class UiHelper{
  static Product(String imgUrl, String title){
    return Padding(
      padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20
      ),
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(imgUrl)
                ),
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )

            ),
          ),
          const SizedBox(
            height: 20,
          ),
           Text(title,style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}


