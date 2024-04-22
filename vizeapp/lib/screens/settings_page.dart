import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:vizeapp/theme/theme_provider.dart';

import '../bloc/client/client_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  MaterialStateProperty<Color?> overlayColor =
      MaterialStateColor.resolveWith((states) => Colors.grey);
  bool isSwitched = false;
  bool isSwitchedLanguage = false;

  String camResult = "";
  String locationResult = "";
  
  

  controlPermission() async {
    var status = await Permission.camera.status;
    var statusLocation = await Permission.location.status;

    switch (status) {
      case (PermissionStatus.granted):
        setState(() {
          camResult = "Yetki Onaylandi";
        });
        break;
      case (PermissionStatus.denied):
        setState(() {
          camResult = "Yetki Reddedildi";
        });
        break;
      case PermissionStatus.restricted:
        setState(() {
          camResult = "Yetki Kisitlandi";
        });
        break;
      case PermissionStatus.limited:
        setState(() {
          camResult = "Yetki Limitlendi";
        });
        break;
      case PermissionStatus.permanentlyDenied:
        setState(() {
          camResult = "Yetki Kalici Olarak Reddedildi";
        });
        break;
      case PermissionStatus.provisional:
        setState(() {
          camResult = "Provisional";
        });
        break;
    }
    switch (statusLocation) {
      case (PermissionStatus.granted):
        setState(() {
          locationResult = "Yetki Onaylandi";
        });
        break;
      case (PermissionStatus.denied):
        setState(() {
          locationResult = "Yetki Reddedildi";
        });
        break;
      case PermissionStatus.restricted:
        setState(() {
          locationResult = "Yetki Kisitlandi";
        });
        break;
      case PermissionStatus.limited:
        setState(() {
          locationResult = "Yetki Limitlendi";
        });
        break;
      case PermissionStatus.permanentlyDenied:
        setState(() {
          locationResult = "Yetki Kalici Olarak Reddedildi";
        });
        break;
      case PermissionStatus.provisional:
        setState(() {
          locationResult = "Provisional";
        });
        break;
    }
  }

  @override
  void initState() {
    controlPermission();    
    super.initState();     
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 55),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const Text("Theme: ", style: TextStyle(fontSize: 25)),
                    Switch(
                      activeTrackColor: Theme.of(context).colorScheme.secondary,
                      activeColor: const Color.fromARGB(255, 218, 221, 211),
                      value: isSwitched,
                      onChanged: (value) => setState(
                        () {
                          isSwitched = value;
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Text("Language: ", style: TextStyle(fontSize: 25)),
                    const Gap(10),
                    const Text("EN"),
                    Row(
                      children: [                        
                        Switch(
                          activeTrackColor: Colors.white,
                          activeColor: Colors.red.shade400,
                          value: isSwitchedLanguage,
                          onChanged: (value) => setState(
                            () {
                              isSwitchedLanguage = value;
                              
                            },
                          ),
                        ),
                      ],
                    ),
                    const Text("TR"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const Text("Lanuage: ", style: TextStyle(fontSize: 25)),
                    MaterialButton(
                      onPressed: () =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(),
                      color: Theme.of(context).primaryColor,
                      child: const Text(
                        "En-Tr",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(50),
              ExpansionTile(
                title: const Text("Camera Permissions"),
                children: [
                  Text(camResult),
                  const Gap(10),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: overlayColor),
                      onPressed: () async {
                        final status = await Permission.camera.request();
                      },
                      child:const Text("Ask for Permission")),
                  const Gap(10),
                ],
              ),
              const Gap(10),
              ExpansionTile(
                title: const Text("Location Permissions"),
                children: [
                  Text(locationResult),
                  const Gap(10),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: overlayColor),
                      onPressed: () async {
                        final status = await Permission.location.request();
                      },
                      child:const Text("Ask for Permission")),
                      const Gap(10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
