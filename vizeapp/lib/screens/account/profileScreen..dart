import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

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
  File? _file;
  String _photoScale = "";
  profilePhotoUpdate() async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? selectedFile = await picker.pickImage(
          source: ImageSource.gallery, requestFullMetadata: false);
      if (selectedFile == null) {
        setState(() {
          _file = null;
        });
        return;
      }

      var fileLength = await selectedFile.length();

      var dosyaFormati = selectedFile.name.split(".").last;

      bool resizable = false;

      switch (dosyaFormati.toLowerCase()) {
        case ("jpg"):
        case ("jpeg"):
        case ("png"):
        case ("bmp"):
        case ("tiff"):
        case ("ico"):
        case ("gif"):
        case ("webp"):
          resizable = true;
      }

      if (!resizable) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Turu"),
            content: Text("Sectiginiz dosya turu desteklenmiyor."),
          ),
        );
      }

      img.Image? temp;

      if (dosyaFormati.toLowerCase() == "jpg" ||
          dosyaFormati.toLowerCase() == "jpeg") {
        temp = img.decodeJpg(File(selectedFile.path).readAsBytesSync());
      } else if (dosyaFormati.toLowerCase() == "png") {
        temp = img.decodePng(File(selectedFile.path).readAsBytesSync());
      } else if (dosyaFormati.toLowerCase() == "bmp") {
        temp = img.decodeBmp(File(selectedFile.path).readAsBytesSync());
      } else if (dosyaFormati.toLowerCase() == "tiff") {
        temp = img.decodeTiff(File(selectedFile.path).readAsBytesSync());
      } else if (dosyaFormati.toLowerCase() == "ico") {
        temp = img.decodeIco(File(selectedFile.path).readAsBytesSync());
      } else if (dosyaFormati.toLowerCase() == "gif") {
        temp = img.decodeGif(File(selectedFile.path).readAsBytesSync());
      } else if (dosyaFormati.toLowerCase() == "webp") {
        temp = img.decodeWebP(File(selectedFile.path).readAsBytesSync());
      }

      if (temp!.width < 500 || temp!.height < 500 || temp == null) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Boyutu"),
            content: Text(
                "Sectiginiz dosya boyutları kucuktur en az 500x500px olmalıdır."),
          ),
        );

        return;
      }

      img.Image tumbnail = img.copyResize(temp, width: 500);
      final resizedFileData = img.encodeJpg(tumbnail, quality: 85);

      final Directory tempDir = await getTemporaryDirectory();
      final Directory appSupportDir = await getApplicationSupportDirectory();
      final Directory appCacheDir = await getApplicationCacheDirectory();

      
      File yeniFile = File(selectedFile.path + "_resized.jpg");
      yeniFile.writeAsBytesSync(resizedFileData);
      
      setState(() {
        _file = yeniFile;
        _photoScale = "${temp!.width}x${temp.height}";
      });
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
                color: Color.fromARGB(255, 77, 0, 201),
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
            if (_file != null)
              Column(
                children: [
                  Text("Photo Scale: ${_photoScale}"),
                  Text("File Size: ${_file!.lengthSync() / 1000} KB"),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        FileImage(_file!), //"${temp.width}x${temp.height}"
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
