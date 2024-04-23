import 'package:flutter/material.dart';
import 'package:vizeapp/components/my_button.dart';

import '../core/localization.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,required this.controller,required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: AppLocalizations.of(context).getTranslate("add_new_task"),
              ),
            ),

            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(
                  text: AppLocalizations.of(context).getTranslate("save"),
                  onPressed: onSave,
                ),

                const SizedBox(width: 10),
                //cancel button
                MyButton(
                  text: AppLocalizations.of(context).getTranslate("cancel"),
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
