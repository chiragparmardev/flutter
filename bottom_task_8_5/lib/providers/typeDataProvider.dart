// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class TypeDataProvider extends ChangeNotifier {
  List<TypeData> _typeDataList = [
    TypeData(title: 'Type', subTitle: 'Hotel'),
    TypeData(title: 'Type', subTitle: 'Apartment'),
    TypeData(title: 'Type', subTitle: 'holiday house'),
    TypeData(title: 'Type', subTitle: 'Hostel'),
    TypeData(title: 'Type', subTitle: 'Other'),
  ];

  List<TypeData> _room = [
    TypeData(title: 'room', subTitle: '1 Bedroom'),
    TypeData(title: 'room', subTitle: '2 Bedroom'),
    TypeData(title: 'room', subTitle: '3 Bedroom'),
    TypeData(title: 'room', subTitle: 'Other'),
  ];

  List<TypeData> _style = [
    TypeData(title: 'style', subTitle: 'single'),
    TypeData(title: 'style', subTitle: 'double'),
    TypeData(title: 'style', subTitle: 'twin'),
    TypeData(title: 'style', subTitle: 'queen'),
    TypeData(title: 'style', subTitle: 'king'),
  ];

  List<TypeData> _rating = [
    TypeData(title: 'rating', subTitle: '5', isSelected: true),
    TypeData(title: 'rating', subTitle: '4', isSelected: false),
    TypeData(title: 'rating', subTitle: '3', isSelected: false),
    TypeData(title: 'rating', subTitle: '2', isSelected: false),
    TypeData(title: 'rating', subTitle: '1', isSelected: false),
    TypeData(title: 'rating', subTitle: "Doesn't matter", isSelected: false),
  ];

  // List<TypeData> _selectedTypeDataList = [];
  List<List<TypeData>> _selectedTypeDataLists = [];

  List<TypeData> get typeDataList => _typeDataList;
  List<TypeData> get roomList => _room;
  List<TypeData> get styleList => _style;
  List<TypeData> get ratingList => _rating;
  List<List<TypeData>> get selectedTypeDataLists => _selectedTypeDataLists;


  void updateTypeData(int index, bool isSelected) {
    _typeDataList[index].isSelected = isSelected;
    notifyListeners();
  }

  void updateRoomData(int index, bool isSelected) {
    _room[index].isSelected = isSelected;
    notifyListeners();
  }

  void updateStyleData(int index, bool isSelected) {
    _style[index].isSelected = isSelected;
    notifyListeners();
  }


  void updateRatingData(int index, bool isSelected) {
    _rating[index].isSelected = isSelected;
    notifyListeners();
  }

  void addSelectedTypes() {
    List<TypeData> selectedTypes = [];
    for (var type in _typeDataList) {
      if (type.isSelected) {
        selectedTypes.add(type);
        type.isSelected = false;
      }
    }
    if (selectedTypes.isNotEmpty) {
      _selectedTypeDataLists.add(selectedTypes);
    }
    notifyListeners();
  }

  void addroom() {
    List<TypeData> selectedTypes = [];
    for (var type in _room) {
      if (type.isSelected) {
        selectedTypes.add(type);
        type.isSelected = false;
      }
    }
    if (selectedTypes.isNotEmpty) {
      _selectedTypeDataLists.add(selectedTypes);
    }
    notifyListeners();
  }

  void addstyle() {
    List<TypeData> selectedTypes = [];
    for (var type in _style) {
      if (type.isSelected) {
        selectedTypes.add(type);
        type.isSelected = false;
      }
    }
    if (selectedTypes.isNotEmpty) {
      _selectedTypeDataLists.add(selectedTypes);
    }
  }

  void addRating() {
    List<TypeData> selectedTypes = [];
    for (var type in _rating) {
      if (type.isSelected) {
        selectedTypes.add(type);
        type.isSelected = false;
      }
    }
    if (selectedTypes.isNotEmpty) {
      _selectedTypeDataLists.add(selectedTypes);
    }
  }

  void deleteSelectedDataAtIndex(int index) {
    if (index >= 0 && index < _selectedTypeDataLists.length) {
      _selectedTypeDataLists.removeAt(index);
      notifyListeners();
    }
  }
}

class TypeData {
  final String title;
  final String subTitle;
  bool isSelected;

  TypeData(
      {required this.title, required this.subTitle, this.isSelected = false});
}

