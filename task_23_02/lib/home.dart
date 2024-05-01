import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_23_02/Product.dart';
import 'package:task_23_02/setting.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.red,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text('CP'),
                ),
                accountName: Text('Chirag Parmar'),
                accountEmail: Text(
                  'chirag@gmail.com',
                )),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add items'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
              },
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
            ),
            const ListTile(
              leading: Icon(Icons.share),
              title: Text('Share with friend'),
            ),
            const ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Rate & Review'),
            ),
            const ListTile(
              leading: Icon(Icons.flag),
              title: Text('Privacy Policy'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Home body'),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[300]),
              clipBehavior: Clip.hardEdge,
              child: Builder(builder: (context) {
                return Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: const Center(
                            child: Text(
                          'Open Drawer',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ))),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
