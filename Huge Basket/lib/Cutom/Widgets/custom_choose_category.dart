import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class CustomChooseCategory extends StatelessWidget {
  final Image imgUrl;
  final String title;
  final bool isSelected;
  const CustomChooseCategory({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColor.primary : AppColor.grey500;
    final boxShadowColor =
        isSelected ? AppColor.greenShadow : AppColor.greyShadow;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 66,
              width: 66,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: color, width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: boxShadowColor, blurRadius: 5, spreadRadius: 1)
                  ]),
              child: Center(
                child: Image(
                  image: imgUrl.image,
                  width: 30,
                  height: 30,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: TextStyle(
                color: color, fontSize: 10, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
