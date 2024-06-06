import 'package:dio/dio.dart';

class API {
  getStaticPage() async {
    return await Future.delayed(const Duration(seconds: 3), () {
      return {
        "splash": {
          "background":
              "https://static.vecteezy.com/system/resources/previews/036/386/786/non_2x/seamless-pattern-with-cute-retro-sports-sneakers-vintage-texture-for-textile-wrapping-paper-cartoon-background-vector.jpg",
          "backgroundColor": "ffffff",
          "logo":
              "https://e7.pngegg.com/pngimages/820/94/png-clipart-shoe-nike-air-max-sneakers-running-running-shoes-orange-outdoor-shoe.png",
          "duration": 3
        },
        "profile": {
          "profilePicture":
              "https://www.shutterstock.com/image-photo/profile-picture-smiling-successful-young-260nw-2040223583.jpg"
        }
      };
    });
  }

  download(String path, String savePath) async {
    try {
      Dio dio = Dio();

      await dio.download(path, savePath);
    }
    on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
