import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vizeapp/theme/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Settings"),
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
                      activeColor:const Color.fromARGB(255, 218, 221, 211),
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
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const Text("Lanuage: ", style: TextStyle(fontSize: 25)),
                    MaterialButton(
                      onPressed: () =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(),
                      color: Theme.of(context).primaryColor,
                      child:const Text(
                        "En-Tr",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
