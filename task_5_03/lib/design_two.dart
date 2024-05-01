import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfileCard {
  final String imgUrl;
  final String title;
  final String subTitle;
  final String email;
  final String phone;

  ProfileCard(this.imgUrl, this.title, this.subTitle, this.email, this.phone);
}

class DesignTwo extends StatefulWidget {
  const DesignTwo({super.key});

  @override
  State<DesignTwo> createState() => _DesignTwoState();
}

class _DesignTwoState extends State<DesignTwo> {
  List<ProfileCard> profileList = [
    ProfileCard('https://imgupscaler.com/images/samples/animal-before.webp',
        'John Doe', 'Flutter Developer', 'John.do222222222222e@gmail.com', '917388990'),
    ProfileCard('https://imgupscaler.com/images/samples/animal-before.webp',
        'John Doe', 'Flutter Developer', 'John.doe@gmail.com', '917388990'),
    ProfileCard('https://imgupscaler.com/images/samples/animal-before.webp',
        'John Doe', 'Flutter Developer', 'John.doe@gmail.com', '917388990'),
    ProfileCard('https://imgupscaler.com/images/samples/animal-before.webp',
        'John Doe', 'Flutter Developer', 'John.doe@gmail.com', '917388990')
  ];

  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.wait(profileList.map((product) async {
      await precacheImage(NetworkImage(product.imgUrl), context);
    })).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Profile Card',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _isLoading
          ? Center(
              child: Lottie.asset('assets/images/loading.json',
                  height: 200, fit: BoxFit.contain))
          : SingleChildScrollView(
              child: Column(
                children: List.generate(profileList.length, (index) {
                  return ProfileCardCustom(
                      imgUrl: profileList[index].imgUrl,
                      title: profileList[index].title,
                      subTitle: profileList[index].subTitle,
                      email: profileList[index].email,
                      phone: profileList[index].phone);
                }),
              ),
            ),
    );
  }
}

class ProfileCardCustom extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subTitle;
  final String email;
  final String phone;
  const ProfileCardCustom(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.subTitle,
      required this.email,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2.0,
        ),
      ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      imgUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    label: Text(
                      email,
                      style: const TextStyle(color: Colors.black),
                    )),
              ),
              Flexible(
                child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    label: Text(
                      phone,
                      style: const TextStyle(color: Colors.black),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
