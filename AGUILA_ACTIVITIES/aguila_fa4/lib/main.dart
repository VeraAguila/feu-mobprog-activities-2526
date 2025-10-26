import 'package:aguila_fa4/book_rating/rating_screen.dart';
import 'package:flutter/material.dart';

Color defaultColor = Colors.blue;

var xColorScheme = ColorScheme.fromSeed(
  seedColor: defaultColor,
);

var xDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: defaultColor,
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: xDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: xDarkColorScheme.onPrimaryContainer,
          foregroundColor: xDarkColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: xDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: xDarkColorScheme.primaryContainer,
            foregroundColor: xDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: xDarkColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: xDarkColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.normal,
            color: xDarkColorScheme.onSecondaryContainer,
            fontSize: 12,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: xColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: xColorScheme.onPrimaryContainer,
          foregroundColor: xColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: xColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: xColorScheme.primaryContainer,
            foregroundColor: xColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: xColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: xColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.normal,
            color: xColorScheme.onSecondaryContainer,
            fontSize: 12,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: RatingScreen(),
    ),
  );
}
