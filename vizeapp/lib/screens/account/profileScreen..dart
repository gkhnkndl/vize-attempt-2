import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/goBack.dart';
import '../../models/menuItem.dart';
import '../../models/profileItem.dart';
//basit bir profil ekranı daha sonra geliştirilecektir.

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  profilePhotoUpdate() async {
    try {
      ImagePicker picker = ImagePicker();
      var selectedFile = await picker.pickImage(source: ImageSource.gallery);
    } on Exception catch (e) {
      print("Error");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
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
            OutlinedButton(
              onPressed: profilePhotoUpdate,
              child: const Text("Update Profile Picture"),
            ),
            const SizedBox(height: 20),
            const GoBack(),
          ],
        ),
      ),
    );
  }
}
