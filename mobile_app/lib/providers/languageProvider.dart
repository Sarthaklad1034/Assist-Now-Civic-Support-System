import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class languageProvider extends ChangeNotifier {
  static const List<Map<String, dynamic>> languages = [
    {'name': 'English', 'locale': 'en'},
    {'name': "Hindi",'locale':'hi'},
    {'name': "Marathi", 'locale': 'mr'},
    {'name': "Gujarati", 'locale': 'gu'},
    {'name': "Tamil", 'locale': 'ta'},
    {'name': "Telugu", 'locale': 'te'},
    {'name': "Bengali", 'locale': 'bn'},
    {'name': "Kannada", 'locale': 'kn'},
    {'name': "Malayalam", 'locale': 'ml'},
    {'name': "Odia", 'locale': 'or'},
    {'name': "Assamese", 'locale': 'as'},
  ];
  Locale selectedLocale=Locale('en');
  void changeLanguage(String language) {
    selectedLocale = Locale(language);
    notifyListeners();
  }
}
