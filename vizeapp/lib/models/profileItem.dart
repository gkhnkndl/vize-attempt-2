import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Kullanıcı bilgileri içeren profil fotoğrafı ve isim bulunan yapının
//widget sayfası
class ProfileItem extends StatelessWidget {
  final Function()? onTap;
  final String avatar;
  final String user;

  const ProfileItem({
    super.key,
    this.onTap,
    required this.avatar,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(3, 238, 226, 1),
                    Color.fromARGB(255, 4, 245, 4)
                  ]),
                ),
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatar),
                    radius: 24,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                user,
                style: GoogleFonts.raleway(
                    fontSize: 20, color: Color.fromARGB(255, 41, 228, 203)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItemSecondary extends StatelessWidget {
  final Function()? onTap;
  final String avatar;
  final String user;

  const ProfileItemSecondary({
    super.key,
    this.onTap,
    required this.avatar,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(3, 238, 226, 1),
                        Color.fromARGB(255, 4, 245, 4)
                      ]),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(avatar),
                        radius: 34,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    user,
                    style: GoogleFonts.raleway(
                        fontSize: 25, color: Color.fromARGB(255, 41, 228, 203)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}