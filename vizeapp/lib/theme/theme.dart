import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 228, 228, 228),
    primary:  Color.fromARGB(255, 240, 240, 240),
    secondary: Color.fromARGB(255, 90, 90, 90),
  )
);


ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  )
);
//https://rydmike.com/flexcolorscheme/themesplayground-latest/

//https://zoom.us/rec/play/3EEsmTcETFV6GH-57WbeEGtitcgfoU1jU0Td3O9T4y838kndv2rkIv4e0aR463fwtWl1e1jxR6xGScA2.vEUjqIJXZCmi5D--?hasValidToken=false&canPlayFromShare=true&from=share_recording_detail&continueMode=true&componentName=rec-play&originRequestUrl=https%3A%2F%2Fzoom.us%2Frec%2Fshare%2F-qsz9DNJBSsVmP37OyFzrShLiI2JsdypNE2aN2wsiuTWCACNbZQosKa_wWIlb0Px.x_2XI7AOPeLtjVkS&autoplay=true&startTime=1709712781000

//01:05:45 kısım