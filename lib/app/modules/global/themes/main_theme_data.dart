import 'package:flutter/material.dart';

import 'buttons_theme.dart';
import 'color_theme.dart';
import 'typography_theme.dart';

class MainThemeData {
  static ThemeData mainThemeData(BuildContext context) =>
      ThemeData.light().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: ColorsTheme.primaryColor,
              onPrimary: ColorsTheme.neutralColor[900],
              secondary: ColorsTheme.primaryColor,
            ),
        textTheme: TypographyTheme.mainTextTheme(context)
            .copyWith(
              button: TypographyTheme.buttonTextStyle,
            )
            .apply(
              bodyColor: ColorsTheme.neutralColor[50],
            ),
        scaffoldBackgroundColor: ColorsTheme.neutralColor[800],
        // textButtonTheme: DarkButtonsTheme.textButtonThemeData,
        elevatedButtonTheme: DarkButtonsTheme.elevatedButtonThemeData,
        // outlinedButtonTheme: DarkButtonsTheme.outlinedButtonThemeData,
      );
}
