import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool iscalculate = false;
  bool wifi = false;
  bool microphone = false;
  bool location = false;
  bool haptics = false;
  int selectedOption = 0;

  void toggleSwitch1(bool value) {
    setState(() {
      iscalculate = !iscalculate;
      if (iscalculate == true) {
        scafoldshaw("Calculated data");
      }
    });
  }

  void toggleSwitch2(bool value) {
    setState(() {
      wifi = !wifi;
      if (wifi == true) {
        scafoldshaw("wifi");
      }
    });
  }

  void microphoneCheckbox(bool? value) {
    setState(() {
      microphone = !microphone;
      if (microphone == true) {
        scafoldshaw("microphone");
      }
    });
  }

  void locationCheckbox(bool? value) {
    setState(() {
      location = !location;
      if (location == true) {
        scafoldshaw("location");
      }
    });
  }

  void hapticsCheckbox(bool? value) {
    setState(() {
      haptics = !haptics;
      if (haptics == true) {
        scafoldshaw("haptics");
      }
    });
  }

  void scafoldshaw(String title) {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text('Selected value is $title'),
    // ));
    setState(() {
      Fluttertoast.showToast(
          msg: 'Selected value is $title',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.black,
          backgroundColor: Colors.green,
          fontSize: 16.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Toggle',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SwitchListTile(
            title: const Text('Celculated data'),
            value: iscalculate,
            onChanged: toggleSwitch1,
          ),
          SwitchListTile(
            title: const Text('wifi data'),
            value: wifi,
            onChanged: toggleSwitch2,
          ),
          const Divider(),
          const Text(
            'Single Check',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          ListTile(
            leading: const Text(
              "Allow Notification",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            trailing: Radio(
              value: 1,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                  if (selectedOption == 1) {
                    scafoldshaw("Allow Notification");
                  }
                });
              },
            ),
          ),
          ListTile(
            leading: const Text(
              "Turn Off Notification",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            trailing: Radio(
              value: 2,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                  if (selectedOption == 2) {
                    scafoldshaw("Turn off notification");
                  }
                });
              },
            ),
          ),
          const Divider(),
          const Text(
            'Multiple Check',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          CheckboxListTile(
            value: microphone,
            onChanged: microphoneCheckbox,
            title: const Text('Microphone access'),
          ),
          CheckboxListTile(
            value: location,
            onChanged: locationCheckbox,
            title: const Text('Location access'),
          ),
          CheckboxListTile(
            value: haptics,
            onChanged: hapticsCheckbox,
            title: const Text('Haptics'),
          ),
        ]),
      ),
    );
  }
}
