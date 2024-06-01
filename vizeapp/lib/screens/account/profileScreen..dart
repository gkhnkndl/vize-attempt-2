import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/goBack.dart';
import '../../models/menuItem.dart';
import '../../models/profileItem.dart';
//basit bir profil ekranı daha sonra geliştirilecektir.

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const ProfileItem(
              avatar: "assets/images/logo.png",
              user: "Gökhan Kundala",
            ),            
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(38, 158, 158, 158),
              ),
              child: Column(
                children: [
                  Text(
                    "Kullanıcı Adı: gkhnkndl",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Telefon Numarası: 0544 836 4520",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Bölge: İstanbul - Avrupa",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Ünvan: Operasyon Müdürü",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const Gap(20),
            OutlinedButton(onPressed: () {
              
            }, child: Text("Update Profile Picture")),
            const SizedBox(height: 20),
            const GoBack(),
          ],
        ),
      ),
    );
  }
}