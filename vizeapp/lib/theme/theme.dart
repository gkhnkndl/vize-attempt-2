import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme:const ColorScheme.light(
    background: Color(0xFFF8FAFC),
    primary:  Color(0xFF0061A4),
    primaryContainer: Color(0xFFD1E4FF),    
    secondary: Color(0xFF006781),
    secondaryContainer: Color(0xFFB9EAFF),
    onPrimary: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF111314),
    onSecondary: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFF101314)
  )
);


ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme:const ColorScheme.dark(
    background: Color(0xFF181A1D),
    primary:  Color(0xFF9ECAFF),
    primaryContainer: Color(0xFF00497D),    
    secondary: Color(0xFF86D1EE),
    secondaryContainer: Color(0xFF004D62),
    onPrimary: Color(0xFF101314),
    onPrimaryContainer: Color(0xFFDFEBF3),
    onSecondary: Color(0xFF0E1414),
    onSecondaryContainer: Color(0xFFDFEBEF)   
  )
);
//https://rydmike.com/flexcolorscheme/themesplayground-latest/

//https://zoom.us/rec/play/3EEsmTcETFV6GH-57WbeEGtitcgfoU1jU0Td3O9T4y838kndv2rkIv4e0aR463fwtWl1e1jxR6xGScA2.vEUjqIJXZCmi5D--?hasValidToken=false&canPlayFromShare=true&from=share_recording_detail&continueMode=true&componentName=rec-play&originRequestUrl=https%3A%2F%2Fzoom.us%2Frec%2Fshare%2F-qsz9DNJBSsVmP37OyFzrShLiI2JsdypNE2aN2wsiuTWCACNbZQosKa_wWIlb0Px.x_2XI7AOPeLtjVkS&autoplay=true&startTime=1709712781000

//01:05:45 kısım