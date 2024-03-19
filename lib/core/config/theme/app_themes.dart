import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color/custom_color.dart';

class CustomTheme {
  static const lightThemeFont = "DMSans", darkThemeFont = "DMSans";

  // light theme
  static final lightTheme = ThemeData(
    primaryColor: CustomColor.primaryBGLightColor,
    backgroundColor: CustomColor.whiteColor,
    scaffoldBackgroundColor: CustomColor.whiteColor,
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: lightThemeFont,
    splashColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
          fillColor: CustomColor.textFieldBglight,
          contentPadding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          hintStyle: TextStyle(
            color: CustomColor.textFieldHintlight
          )
      ),
    textTheme:  const TextTheme(
      bodySmall: TextStyle(color: CustomColor.textFieldBorder ),
      bodyMedium: TextStyle(color: CustomColor.cardDescriptionTextColor),
      bodyLarge:TextStyle(color: CustomColor.kPrimaryColorx),
      labelSmall: TextStyle(color: CustomColor.kPrimaryColorx),
      labelMedium: TextStyle(color: CustomColor.kPrimaryColorx),
      labelLarge: TextStyle(color: CustomColor.kPrimaryColorx),
      displaySmall: TextStyle(color: CustomColor.kPrimaryColorx),
      displayMedium: TextStyle(color: CustomColor.kPrimaryColorx),
      displayLarge: TextStyle(color: CustomColor.kPrimaryColorx),
    ),
    switchTheme: SwitchThemeData(
      thumbColor:
      MaterialStateProperty.resolveWith<Color>((states) => lightThemeColor),
    ),
    appBarTheme: const AppBarTheme(
      // color:CustomColor.kPrimaryColorx,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color:CustomColor.kPrimaryColorx),
      backgroundColor: CustomColor.whiteColor,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color:CustomColor.kPrimaryColorx,
        fontSize: 18, //20
      ),
      actionsIconTheme: IconThemeData(color: CustomColor.kPrimaryColorx),
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: CustomColor.whiteColor,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: CustomColor.whiteColor,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CustomColor.kPrimaryColorx,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(
              size: 28
          ),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
              color: CustomColor.kPrimaryColorx
          )
      )
  );

  // dark theme
  static final darkTheme = ThemeData(
    primaryColor: CustomColor.primaryColor,
    backgroundColor: CustomColor.kPrimaryColorx,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CustomColor.kPrimaryColorx,
    useMaterial3: true,
    fontFamily: darkThemeFont,
    splashColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
          fillColor: CustomColor.textFieldBgDark,
          contentPadding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          hintStyle: TextStyle(
              color: CustomColor.textFieldHitDark
          )
      ),
    textTheme:  const TextTheme(
        bodySmall: TextStyle(color: CustomColor.cardDescriptionTextColor),
        bodyMedium: TextStyle(color: CustomColor.cardTitleTextColor),
        bodyLarge:TextStyle(color: CustomColor.whiteColor),
        labelSmall: TextStyle(color: CustomColor.whiteColor),
        labelMedium: TextStyle(color: CustomColor.whiteColor),
        labelLarge: TextStyle(color: CustomColor.whiteColor),
        displaySmall: TextStyle(color: CustomColor.whiteColor),
        displayMedium: TextStyle(color: CustomColor.whiteColor),
        displayLarge: TextStyle(color: CustomColor.whiteColor),
      ),
    switchTheme: SwitchThemeData(
      trackColor:
      MaterialStateProperty.resolveWith<Color>((states) => darkThemeColor),
    ),
    appBarTheme: AppBarTheme(
      // color:CustomColor.kPrimaryColorx,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color:CustomColor.whiteColor),
      backgroundColor: CustomColor.kPrimaryColorx,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color:CustomColor.whiteColor,
        fontSize: 18, //20
      ),
      actionsIconTheme: IconThemeData(color: lightThemeColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: CustomColor.kPrimaryColorx,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: CustomColor.kPrimaryColorx,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CustomColor.whiteColor,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(
              size: 28
          ),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
              color: CustomColor.whiteColor
          )
      )
  );

  // colors
  static Color lightThemeColor = Colors.white,
      white = Colors.white,
      black = Colors.black,
      darkThemeColor = CustomColor.kPrimaryColorx;
}





// ThemeData theme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     fontFamily: "DMSans",
//       primaryColor: CustomColor.kPrimaryColorx,
//     useMaterial3: true,
//
//     bottomNavigationBarTheme:bottomNavigationBarTheme(),
//     splashColor: Colors.transparent,
//       // highlightColor: Colors.transparent,
//     navigationBarTheme:navigationBarTheme(),
//
//   );
// }
//
// ThemeData darkTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     fontFamily: "DMSans",
//     primaryColor: CustomColor.kPrimaryColorx,
//     useMaterial3: true,
//     appBarTheme: DarkappBarTheme(),
//     bottomNavigationBarTheme:bottomNavigationBarTheme(),
//     splashColor: Colors.transparent,
//     // highlightColor: Colors.transparent,
//     navigationBarTheme:navigationBarTheme(),
//
//   );
// }
//
// AppBarTheme DarkappBarTheme() {
//   return const AppBarTheme(
//     color:CustomColor.kPrimaryColorx,
//     elevation: 0,
//     centerTitle: true,
//
//     iconTheme: IconThemeData(color:CustomColor.whiteColor),
//     titleTextStyle: TextStyle(color: CustomColor.whiteColor, fontSize: 18),
//   );
// }
//

//
//  BottomNavigationBarThemeData? bottomNavigationBarTheme() {
//   return const BottomNavigationBarThemeData(
//     backgroundColor: CustomColor.kPrimaryColorx,
//     elevation: 1,
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: CustomColor.whiteColor,
//     showUnselectedLabels: true,
//     selectedIconTheme: IconThemeData(
//       size: 28
//     ),
//     unselectedItemColor: Colors.grey,
//     selectedLabelStyle: TextStyle(
//       color: CustomColor.whiteColor
//     )
//   );
// }
//
// NavigationBarThemeData? navigationBarTheme() {
//   return const NavigationBarThemeData(
//     backgroundColor: CustomColor.kPrimaryColorx,
//     elevation: 0,
//     indicatorColor: CustomColor.whiteColor,
//   );
// }