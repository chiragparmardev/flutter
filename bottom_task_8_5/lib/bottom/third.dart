import 'package:bottom_task_8_5/providers/typeDataProvider.dart';
import 'package:bottom_task_8_5/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThirdBottom extends StatelessWidget {
  const ThirdBottom({super.key});

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
                  const CustomPageLabelText(title: 'Text', pageno: '3'),
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
                'Please select a accommodation type',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            Consumer<TypeDataProvider>(builder: (context, value, child) {
              return Column(
                children: [
                 
                  for (var type in value.ratingList )
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: type.isSelected,
                      onChanged: (v) {
                        int index = value.ratingList.indexOf(type);
                        value.updateRatingData(index, v ?? false);
                      },
                      title:value.ratingList.indexOf(type) < 5 ? Row(
                        children: List.generate( int.parse(type.subTitle), (index) => const Icon(Icons.star,color: Colors.yellow,))
                        ,
                      ) :  Text(type.subTitle),
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
                        value.addSelectedTypes();
                        Navigator.pop(context);
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

