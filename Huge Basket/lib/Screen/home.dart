import 'package:flutter/material.dart';
import 'package:task_27_03/Data/cart_data.dart';
import 'package:task_27_03/Screen/profile.dart';
import 'package:task_27_03/Screen/store_page.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext contexpt) {
    int totalItems = 0;

    for (var shopMap in cartItems) {
      List<Items> shopItems = List<Items>.from(shopMap['items']);
      totalItems += shopItems.length;
    }
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          StorePage(),
          Center(
            child: Text('My Orders'),
          ),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedFontSize: 15,
              unselectedFontSize: 15,
              iconSize: 25,
              elevation: 0,
              currentIndex: _selectedIndex,
              selectedItemColor: AppColor.primary,
              backgroundColor: AppColor.greenLight200.withOpacity(0.9),
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.store_mall_directory,
                  ),
                  label: 'Stores',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    children: [
                      const Icon(Icons.shopping_cart),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColor.primary),
                          child: Center(
                            child: Text(
                              totalItems.toString(),
                              style:
                                  const TextStyle(color: AppColor.white, fontSize: 7),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: 'My Orders',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: constraints.maxWidth / 3 * (_selectedIndex) +
                  (constraints.maxWidth / 6) -
                  30,
              child: Container(
                width: 60,
                height: 5,
                decoration: const BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
              ),
            )
          ],
        ),
      ),
    );
    // DefaultTabController(
    //   length: 3,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     backgroundColor: AppColor.white,
    //     body: Stack(children: [
    //       const TabBarView(
    //           children: [StorePage(), MyOrderPage(), ProfilePage()]),
    //       Positioned(
    //         bottom: 0,
    //         left: 0,
    //         right: 0,
    //         child: ClipRect(
    //           child: BackdropFilter(
    //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    //             child: Container(
    //               height: 70,
    //               color: AppColor.greenLight200.withOpacity(0.5),
    //               child: TabBar(
    //                 labelPadding: EdgeInsets.zero,
    //                 padding: EdgeInsets.zero,
    //                 indicatorPadding: EdgeInsets.zero,
    //                 indicatorColor: AppColor.primary,
    //                 labelColor: AppColor.primary,
    //                 tabs: <Widget>[
    //                   const Tab(
    //                     iconMargin: EdgeInsets.zero,
    //                     icon: Icon(Icons.shopping_cart),
    //                     text: 'Store',
    //                   ),
    //                   Stack(
    //                     children: [
    //                       const Tab(
    //                         iconMargin: EdgeInsets.zero,
    //                         icon: Icon(Icons.list_alt_outlined),
    //                         text: 'My Order',
    //                       ),
    //                       Positioned(
    //                         top: 5,
    //                         right: 12,
    //                         child: Container(
    //                           height: 17,
    //                           width: 17,
    //                           decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(50),
    //                               color: AppColor.primary),
    //                           child: const Center(
    //                             child: Text(
    //                               "2",
    //                               style: TextStyle(
    //                                   color: AppColor.white, fontSize: 12),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   const Tab(
    //                     iconMargin: EdgeInsets.zero,
    //                     icon: Icon(Icons.person),
    //                     text: 'Profile',
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ]),
    //   ),
    // );
  }
}
