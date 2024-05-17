import 'package:bottom_task_8_5/providers/typeDataProvider.dart';
import 'package:bottom_task_8_5/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondBottom extends StatelessWidget {
  
  const SecondBottom({
    super.key,
  
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Text(
            'Add Hotel',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomIconButton(back: true, onPressed: () {}),
                  const CustomPageLabelText(title: 'Text', pageno: '2'),
                  CustomIconButton(back: false, onPressed: () {})
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Please select the number of bedrooms',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            Consumer<TypeDataProvider>(builder: (context, value, child) {
              return Column(
                children: [
                  for (var type in value.roomList)
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: type.isSelected,
                      onChanged: (v) {
                        int index = value.roomList.indexOf(type);
                        value.updateRoomData(index, v ?? false);
                      },
                      title: Text(type.subTitle),
                    ),
                ],
              );
            }),
             const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Please select the number of bedrooms',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            Consumer<TypeDataProvider>(builder: (context, value, child) {
              return Column(
                children: [
                  for (var type in value.styleList)
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: type.isSelected,
                      onChanged: (v) {
                        int index = value.styleList.indexOf(type);
                        value.updateStyleData(index, v ?? false);
                      },
                      title: Text(type.subTitle),
                    ),
                ],
              );
            }),
            Consumer<TypeDataProvider>(builder: (context, value, child) {
              return Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.indigo[900],
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.hardEdge,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        value.goToPage(2);
                      },
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
