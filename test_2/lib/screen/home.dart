import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_2/AppColor.dart';
import 'package:test_2/app_router.dart';
import 'package:test_2/app_router.gr.dart';
import 'package:test_2/custom/home_card.dart';
import 'package:test_2/route_setting.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> coursesData = [];
  @override
  void initState() {
    super.initState();
    getcources();
  }

  Future getcources() async {
    var box = await Hive.openBox('course');
    coursesData = box.values.toList();
    setState(() {});
    return coursesData;
  }

  Future deleteCourse(int index) async {
    var box = await Hive.openBox('course');
    await box.deleteAt(index);
    setState(() {
      coursesData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.bgGrey,
        automaticallyImplyLeading: false,
        title: const Text(
          'Courses',
          style: TextStyle(
              color: AppColor.textblack,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, MyRouter.add_edit_course);
                AutoRouter.of(context).push(const AddEditCourseScreenRoute());
              },
              icon: const Icon(
                Icons.add,
                size: 25,
                color: AppColor.primary,
              ))
        ],
      ),
      body: FutureBuilder(
          future: getcources(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const Center(child: CircularProgressIndicator());
            // } else if (snapshot.data == null ||
            //     (snapshot.data as List).isEmpty) {
            //   return const Center(child: Text('No Courses'));
            // }
            return ListView(
              children: List.generate(
                  coursesData.length,
                  (index) => GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(coursesData[index]['courseName']),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          // Navigator.pushNamed(
                                          //     context, MyRouter.add_edit_course,
                                          //     arguments: index);

                                          AutoRouter.of(context).push(
                                              const AddEditCourseScreenRoute());
                                        },
                                        child: const Text(
                                          'Edit',
                                          style: TextStyle(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          await deleteCourse(index);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: CustomHomeCard(
                          coursesData: coursesData[index],
                        ),
                      )),
            );
          }),
    );
  }
}
