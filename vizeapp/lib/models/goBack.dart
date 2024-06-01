import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//geri gitme butonunun bulunduğu widget sayfası
class GoBack extends StatelessWidget {
  const GoBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 157, 3, 204),
            Color.fromARGB(255, 194, 3, 153)
          ])),
      width: 120,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0),
        onPressed: () => Navigator.of(context).pop(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Go Back",
                style: GoogleFonts.raleway(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255))),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class GoBack2 extends StatelessWidget {
  const GoBack2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 157, 3, 204),
            Color.fromARGB(255, 194, 3, 153)
          ])),
      width: 120,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          ;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Go Back",
                style: GoogleFonts.raleway(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255))),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}