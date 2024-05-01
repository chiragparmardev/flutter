import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> state = const ['U.P', 'Kerela', 'Goa', 'Bihar'];
  Map<String, List<String>> cites = {
    'U.P': ['Kanpur', 'Lucknow', 'Agra', 'Varanasi'],
    'Bihar': ['Patna', 'Gaya', 'Darbhanga', 'Arrah'],
    'Kerela': ['Kochi', 'Kozhikode', 'Kottayam'],
    'Goa': ['Bicholim', 'Mapusa', 'Panaji', 'Margao'],
  };
  List<String> blank = [];
  String? selectedState;
  String? selectedCity;
  GlobalKey<DropdownSearchState<String>> cityDropdownKey = GlobalKey();
  GlobalKey<DropdownSearchState<String>> stateDropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff81bcb7),
          title: Text(
            "Choose Location",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                dropdownsearch("State", "Please Enter the State", (value) {
                  setState(() {
                    selectedState = value;
                    print(selectedCity);
                    selectedCity = null;
                    cityDropdownKey.currentState?.clear();
                    print(selectedCity);
                  });
                }, state, stateDropdownKey),
                const SizedBox(
                  height: 40,
                ),
                dropdownsearch("City", "Please Enter the City", (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                    selectedState != null
                        ? cites[selectedState!]!
                            .map((e) => e.toString())
                            .toList()
                        : [],
                    cityDropdownKey),
              ],
            ),
          ),
        ),
        bottomSheet: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(370),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color(0xff81bcb7)),
          child: Text(
            "Next",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }

  DropdownSearch<String> dropdownsearch(String labeltxt, String hinttxt,
      Function(String?) onChanged, List<String> items, GlobalKey name) {
    return DropdownSearch<String>(
      autoValidateMode: AutovalidateMode.onUserInteraction,
      popupProps: const PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
      ),
      key: name,
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: Theme.of(context).textTheme.bodySmall,
        dropdownSearchDecoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: labeltxt,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          hintText: hinttxt,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
