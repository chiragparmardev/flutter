import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test1/Utils/AppColor.dart';
import 'package:test1/Utils/Toast.dart';
import 'package:test1/custom/button_select.dart';
import 'package:test1/custom/count_people.dart';
import 'package:test1/custom/location_card.dart';
import 'package:test1/custom/package_card.dart';
import 'package:test1/custom/session_list.dart';
import 'package:test1/custom/story_profile.dart';

class Coaching extends StatefulWidget {
  const Coaching({super.key});

  @override
  State<Coaching> createState() => _CoachingState();
}

class _CoachingState extends State<Coaching> {
  int selectedSportIndex = -1;
  int selectedCoachingIndex = -1;
  int selectedTimeIndex = -1;
  int selectedLevelIndex = -1;
  late DateTime selectedDate ;
  int _selectedPeopleIndex = -1;
  int selectedLocationIndex = -1;
  int selectedPackageIndex = -1;

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }
  void selectedSport(int index) {
    setState(() {
      selectedSportIndex = index;
    });
  }

  void selectedCoaching(int index) {
    setState(() {
      selectedCoachingIndex = index;
    });
  }

  void selectedTime(int index) {
    setState(() {
      selectedTimeIndex = index;
    });
  }

  void selectedLevel(int index) {
    setState(() {
      selectedLevelIndex = index;
    });
  }

  void selectLocation(int index) {
    setState(() {
      selectedLocationIndex = index;
    });
  }

  void selectPackage(int index) {
    setState(() {
      selectedPackageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("=============================");
    print('selected date${selectedDate}');
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          const Text(
            'Select sport',
            style: TextStyle(
                color: AppColor.white,
                fontFamily: 'mont',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          14.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ButtonOneSelect(
                    text: "padel",
                    index: 0,
                    isSelected: selectedSportIndex == 0,
                    icon: "assets/svgs/racket.svg",
                    onSelect: selectedSport),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "Table Tennish",
                    index: 1,
                    isSelected: selectedSportIndex == 1,
                    icon: "assets/svgs/tableball.svg",
                    onSelect: selectedSport),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "Cricket",
                    index: 2,
                    isSelected: selectedSportIndex == 2,
                    icon: "assets/svgs/bat.svg",
                    onSelect: selectedSport)
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          const Text(
            'Select type of coaching',
            style: TextStyle(
                color: AppColor.white,
                fontFamily: 'mont',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          14.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ButtonOneSelect(
                    text: "1:1",
                    index: 0,
                    isSelected: selectedCoachingIndex == 0,
                    onSelect: selectedCoaching),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "Group",
                    index: 1,
                    isSelected: selectedCoachingIndex == 1,
                    onSelect: selectedCoaching),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "Request",
                    index: 2,
                    isSelected: selectedCoachingIndex == 2,
                    onSelect: selectedCoaching),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "Online",
                    index: 3,
                    isSelected: selectedCoachingIndex == 3,
                    onSelect: selectedCoaching)
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Select Date',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: const Text(
                  'Calender',
                  style: TextStyle(
                      color: AppColor.yellow,
                      fontFamily: 'mont',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Container(
            height: 100.h,
            decoration: BoxDecoration(

            ),
            margin: const EdgeInsets.only(top: 20),
            child: DatePicker(
              DateTime.now(),
              width: 80.w,
              height: 100.h,
              initialSelectedDate: selectedDate,
              // selectionColor: AppColor.yellow,
              selectedTextColor: Colors.yellow,
              deactivatedColor: Colors.red,
              dateTextStyle: const TextStyle(color: Colors.white),
              monthTextStyle: const TextStyle(color: Colors.white),
              dayTextStyle: const TextStyle(color: Colors.white),
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                  print(selectedDate);
                });
              },
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Time',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'See All',
                style: TextStyle(
                    color: AppColor.fontgrey,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          14.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ButtonOneSelect(
                    text: "12:00 Am - 01:00 Am",
                    index: 0,
                    isSelected: selectedTimeIndex == 0,
                    onSelect: selectedTime),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "01:00 Am - 02:00 Am",
                    index: 1,
                    isSelected: selectedTimeIndex == 1,
                    onSelect: selectedTime),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "0:00 Am - 03:00 Am",
                    index: 2,
                    isSelected: selectedTimeIndex == 2,
                    onSelect: selectedTime),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "03:00 Am - 04:00 Am",
                    index: 3,
                    isSelected: selectedTimeIndex == 3,
                    onSelect: selectedTime),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "04:00 Am - 05:00 Am",
                    index: 4,
                    isSelected: selectedTimeIndex == 4,
                    onSelect: selectedTime)
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          const Text(
            'Select Number of People',
            style: TextStyle(
                color: AppColor.white,
                fontFamily: 'mont',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          14.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  6,
                  (index) => CountPeople(
                    index: index,
                    selectedPeopleIndex: _selectedPeopleIndex,
                    onSelectionChange: (selectedIndex) {
                      setState(() {
                        _selectedPeopleIndex = selectedIndex;
                      });
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 20.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.fontgrey, width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (_selectedPeopleIndex >= 0) {
                            _selectedPeopleIndex--;
                          }
                        });
                      },
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: AppColor.fontgrey,
                          size: 11.7.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                    child: Center(
                      child: Text(
                        '${_selectedPeopleIndex + 1}',
                        style: TextStyle(
                            fontFamily: 'mont',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.fontgrey),
                      ),
                    ),
                  ),
                  Container(
                    height: 20.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.fontgrey, width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedPeopleIndex++;
                        });
                      },
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: AppColor.fontgrey,
                          size: 11.7.h,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          const Text(
            'Select level of coaching',
            style: TextStyle(
                color: AppColor.white,
                fontFamily: 'mont',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          14.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ButtonOneSelect(
                    text: "1.0 - 2.5",
                    index: 0,
                    isSelected: selectedLevelIndex == 0,
                    icon: "assets/svgs/save.svg",
                    onSelect: selectedLevel),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "2.5 - 3.5",
                    index: 1,
                    isSelected: selectedLevelIndex == 1,
                    icon: "assets/svgs/save.svg",
                    onSelect: selectedLevel),
                SizedBox(
                  width: 16.w,
                ),
                ButtonOneSelect(
                    text: "3.5 - 5.5",
                    index: 2,
                    isSelected: selectedLevelIndex == 2,
                    icon: "assets/svgs/save.svg",
                    onSelect: selectedLevel)
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          const Text(
            'Select Loaction',
            style: TextStyle(
                color: AppColor.white,
                fontFamily: 'mont',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          14.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => LocationCard(
                    index: index,
                    isSelected: selectedLocationIndex == index,
                    onSelect: selectLocation),
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          const Text(
            'Available Groups Sessions',
            style: TextStyle(
                color: AppColor.white,
                fontFamily: 'mont',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          14.verticalSpace,
          Container(
            decoration: BoxDecoration(
                color: AppColor.mirrorBlack,
                border: Border.all(color: AppColor.white, width: 0.5.w),
                borderRadius: BorderRadius.circular(12.r)),
            child: Padding(
              padding: EdgeInsets.all(12.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SessionList(
                      title: 'Cricket', icon: 'assets/svgs/bat.svg'),
                  16.verticalSpace,
                  const SessionList(
                      title: 'Thursday 07 Sep, 09:00 - 11:00',
                      icon: 'assets/svgs/calendar.svg'),
                  16.verticalSpace,
                  const SessionList(
                      title: 'Men Only (18 - 25 Years only)',
                      icon: 'assets/svgs/share_round.svg'),
                  16.verticalSpace,
                  const SessionList(
                      title: '1.0 - 2.4', icon: 'assets/svgs/save.svg'),
                  16.verticalSpace,
                  const SessionList(
                      title: 'Rocks Lane - Chiswick (Indoor)',
                      icon: 'assets/svgs/location.svg'),
                  16.verticalSpace,
                  const SessionList(
                      title: 'AED 670', icon: 'assets/svgs/Dirham.svg'),
                  16.verticalSpace,
                  Row(
                    children: [
                      const Text(
                        'Members (16/18)',
                        style: TextStyle(
                            color: AppColor.white,
                            fontFamily: 'mont',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.white, width: 1),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 4.h, bottom: 4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/chat.svg',
                                width: 14.09.w,
                                height: 16.92.h,
                              ),
                              3.horizontalSpace,
                              const Text(
                                'Chat',
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontFamily: 'mont',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  14.verticalSpace,
                  const StoryProfile(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            children: [
              const Text(
                'Select Package',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              3.horizontalSpace,
              const Text(
                '(optional)',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          14.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  3,
                  (index) => PackageCard(
                      index: index,
                      isSelected: selectedPackageIndex == index,
                      onSelect: selectPackage)),
            ),
          ),
          35.verticalSpace,
          Container(
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColor.yellow,
                borderRadius: BorderRadius.circular(12.r)),
            child: InkWell(
              onTap: () {
                if (selectedSportIndex == -1) {
                  Utility.showErrorMessage('Select a Sport');
                  return;
                } else if (selectedCoachingIndex == -1) {
                  Utility.showErrorMessage('Select a Coaching');
                  return;
                } else if (selectedTimeIndex == -1) {
                  Utility.showErrorMessage('Select a Time');
                  return;
                } else if (selectedLevelIndex == -1) {
                  Utility.showErrorMessage('Select a Level');
                  return;
                } else if (_selectedPeopleIndex == -1) {
                  Utility.showErrorMessage('Select a People');
                  return;
                } else if (selectedLocationIndex == -1) {
                  Utility.showErrorMessage('Select a Location');
                  return;
                } else if (selectedPackageIndex == -1) {
                  Utility.showErrorMessage('Select a Package');
                  return;
                } else {
                  Utility.showErrorMessage('SUCESSFULLY');
                }
              },
              child: const Center(
                child: Text(
                  'Book Session',
                  style: TextStyle(
                      color: AppColor.black,
                      fontFamily: 'mont',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate);

      });
    }
  }
}
