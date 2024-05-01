import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_28_02/AppColor.dart';

class DesignFour extends StatefulWidget {
  const DesignFour({super.key});

  @override
  State<DesignFour> createState() => _DesignFourState();
}

class _DesignFourState extends State<DesignFour> {
  List<String> storetime = ['24 Hour Service', 'Open Now'];
  List<String> amenites = ['Wifi', 'Online Ordering', 'Parking'];
  List<String> pickupOption = [
    'Store Pickup',
    'Curbside',
    'Beach Delivery',
    'Home Delivery',
    'Table Delivery',
    'Office Delivery'
  ];

  int selectedIndex = 0;
  int selectedIndex2 = 0;
  int selectedIndex3 = 0;

  String selectedStoreHours = '';
  String selectedPickupOption = '';
  String selectedAmenities = '';

  @override
  void initState() {
    super.initState();
    selectedStoreHours = storetime[selectedIndex];
    selectedPickupOption = pickupOption[selectedIndex2];
    selectedAmenities = amenites[selectedIndex3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        leading: Container(
          margin: const EdgeInsets.all(14),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2, color: AppColor.textColor)),
          clipBehavior: Clip.hardEdge,
          child: Material(
            color: Colors.transparent,
            child: Ink(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColor.textColor,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'Filter',
          style: GoogleFonts.pridi(
              textStyle: TextStyle(fontSize: 22, color: AppColor.textColor)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Store Hours",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                runAlignment: WrapAlignment.start,
                children: List.generate(
                  storetime.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedStoreHours = storetime[selectedIndex];
                        // print(selectedStoreHours);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(7),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? AppColor.selectedColor
                            : AppColor.unSelectedColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        storetime[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text("Pickup Option",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                children: List.generate(
                  pickupOption.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex2 = index;
                        selectedPickupOption = pickupOption[selectedIndex2];
                        // print(selectedPickupOption);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(7),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      decoration: BoxDecoration(
                        color: selectedIndex2 == index
                            ? AppColor.selectedColor
                            : AppColor.unSelectedColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        pickupOption[index],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text("Amenities",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                children: List.generate(
                  amenites.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex3 = index;
                        selectedAmenities = amenites[selectedIndex3];
                        // print(selectedAmenities);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(7),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      decoration: BoxDecoration(
                        color: selectedIndex3 == index
                            ? AppColor.selectedColor
                            : AppColor.unSelectedColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        amenites[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.selectedColor,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    // print(
                    //     'selected Store hours = $selectedStoreHours and index is $selectedIndex \nselected pickup option = $selectedPickupOption and index is $selectedIndex2 \nselected Amenities  = $selectedAmenities and index is $selectedIndex3');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Selected Store hours = $selectedStoreHours and index is $selectedIndex\nSelected pickup option = $selectedPickupOption and index is $selectedIndex2\nSelected Amenities  = $selectedAmenities and index is $selectedIndex3',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
