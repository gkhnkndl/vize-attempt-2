import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vizeapp/theme/theme_provider.dart';
import 'package:vizeapp/components/my_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;

  void checkBoxChanged(bool? value, int index) async {
    setState(() {
      isSwitched = !isSwitched;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ), 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:55),
          child: Column(
            children: [                         
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text("Theme: ",style: TextStyle(fontSize: 25)),
                      MaterialButton(
                            onPressed: () => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                            color: Theme.of(context).primaryColor,
                            child: Text("Light-Dark Mode",style: TextStyle(fontSize: 25),),
                          ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text("Lanuage: ",style: TextStyle(fontSize: 25)),
                      MaterialButton(
                            onPressed: () => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                            color: Theme.of(context).primaryColor,
                            child: Text("En-Tr",style: TextStyle(fontSize: 25),),
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