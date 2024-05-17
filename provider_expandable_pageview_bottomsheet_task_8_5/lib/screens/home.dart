import 'package:bottom_task_8_5/bottom/first.dart';
import 'package:bottom_task_8_5/bottom/second.dart';
import 'package:bottom_task_8_5/bottom/third.dart';
import 'package:bottom_task_8_5/providers/typeDataProvider.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bottom Sheets',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<TypeDataProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.selectedTypeDataLists.length,
            itemBuilder: (context, index) {
              final selectedTypeList = value.selectedTypeDataLists[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Selected Data ${index + 1}:',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {
                            value.deleteSelectedDataAtIndex(index);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedTypeList.length,
                    itemBuilder: (context, innerIndex) {
                      final selectedType = selectedTypeList[innerIndex];
                      return ListTile(
                        title: Text(selectedType.title),
                        subtitle: Text(selectedType.subTitle),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton:
       Consumer<TypeDataProvider>(builder: (context, value, child) {
        return  FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              context: context,
              builder: (context) {
                return ExpandablePageView(   
                  controller: value.pageController,  
                  children:const [ FirstBottom(),
                  SecondBottom(),
                  ThirdBottom()
                  ]);
              });
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.open_in_full,
          color: Colors.white,
        ),
      );
       }
       ));
  }
}

class CustomPageLabelText extends StatelessWidget {
  final String title;
  final String pageno;
  const CustomPageLabelText({
    super.key,
    required this.title,
    required this.pageno,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Text(
          'Step $pageno of 3',
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 13),
        )
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final bool back;
  final Function onPressed;
  const CustomIconButton({
    super.key,
    required this.back,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Center(
        child: IconButton.filled(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            onPressed();
          },
          icon: Icon(
            back == true
                ? Icons.arrow_back_ios_new
                : Icons.arrow_forward_ios_outlined,
            color: Colors.indigo[900],
            size: 15,
          ),
          style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 193, 234, 255)),
          ),
        ),
      ),
    );
  }
}
