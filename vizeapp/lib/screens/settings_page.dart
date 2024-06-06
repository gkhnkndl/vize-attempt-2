import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vizeapp/core/localization.dart';
import 'package:vizeapp/theme/theme_provider.dart';
import '../bloc/client/client_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ClientCubit clientCubit;

  bool isSwitched = false;
  bool isSwitchedLanguage = false;
  String camResult = "";
  String locationResult = "";

  MaterialStateProperty<Color?> overlayColor =
      MaterialStateColor.resolveWith((states) => Colors.grey);

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
    _loadData();
    controlPermission();
  }
  //bool loader
  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitched = prefs.getBool("isswitched") ?? false;
      isSwitchedLanguage = prefs.getBool("isswitchedlang") ?? false;
    });
  }
  //bool saver
  void _saveBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isswitched", isSwitched);
    await prefs.setBool("isswitchedlang", isSwitchedLanguage);
  }
  //location and camera permissin
  void controlPermission() async {
    var status = await Permission.camera.status;
    var statusLocation = await Permission.location.status;

    setState(() {
      camResult = _getPermissionStatusText(status);
      locationResult = _getPermissionStatusText(statusLocation);
    });
  }

  String _getPermissionStatusText(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return "Yetki Onaylandı";
      case PermissionStatus.denied:
        return "Yetki Reddedildi";
      case PermissionStatus.restricted:
        return "Yetki Kısıtlandı";
      case PermissionStatus.limited:
        return "Yetki Limitlendi";
      case PermissionStatus.permanentlyDenied:
        return "Yetki Kalıcı Olarak Reddedildi";
      case PermissionStatus.provisional:
        return "Provisional";
      default:
        return "Bilinmeyen Durum";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context).getTranslate("drawer_settings")),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .getTranslate("settings_theme"),
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Light"),
                            Switch(
                              activeTrackColor: Theme.of(context)
                                  .colorScheme.secondary,
                              activeColor: const Color.fromARGB(255, 218, 221, 211),
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  Provider.of<ThemeProvider>(context, listen: false)
                                      .toggleTheme();
                                  _saveBool();
                                });
                              },
                            ),
                            const Text("Dark"),
                          ],
                        ),
                        const Gap(25),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .getTranslate("settings_language"),
                              style: TextStyle(fontSize: 25),
                            ),
                            const Gap(5),
                            Text(clientCubit.state.language),
                          ],
                        ),
                        const Gap(10),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text("EN"),
                                Switch(
                                  activeTrackColor: Colors.white,
                                  activeColor: Colors.red.shade400,
                                  value: isSwitchedLanguage,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitchedLanguage = value;
                                      if (isSwitchedLanguage) {
                                        clientCubit.changeLang(language: "tr");
                                      } else {
                                        clientCubit.changeLang(language: "en");
                                      }
                                      _saveBool();
                                    });
                                  },
                                ),
                                const Text("TR"),
                              ],
                            ),
                          ],
                        ),
                        const Gap(50),
                        ExpansionTile(
                          title: Text(AppLocalizations.of(context)
                              .getTranslate("settings_camera")),
                          children: [
                            Text(camResult),
                            const Gap(10),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: overlayColor,
                              ),
                              onPressed: () async {
                                final status = await Permission.camera.request();
                                controlPermission();
                              },
                              child: const Text("Ask for Permission"),
                            ),
                            const Gap(10),
                          ],
                        ),
                        const Gap(10),
                        ExpansionTile(
                          title: Text(AppLocalizations.of(context)
                              .getTranslate("settings_locate")),
                          children: [
                            Text(locationResult),
                            const Gap(10),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: overlayColor,
                              ),
                              onPressed: () async {
                                final status =
                                    await Permission.location.request();
                                controlPermission();
                              },
                              child: const Text("Ask for Permission"),
                            ),
                            const Gap(10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
