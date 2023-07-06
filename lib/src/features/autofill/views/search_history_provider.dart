import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel();

  List<String> sHistory = [];
  List<String> get getSearchHistory => sHistory;

  void initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sHistory = prefs.getStringList('searchHistory') ?? [];
    notifyListeners();
  }

  void addToHistory({required String searchKeyWord}) async {
    if (searchKeyWord.trim().isEmpty) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> previousSearchHistory =
        prefs.getStringList('searchHistory') ?? [];
          bool found =  previousSearchHistory.contains(searchKeyWord);

  if (found) {
  return;
  } else {
    previousSearchHistory.insert(0, searchKeyWord.trim());
    prefs.setStringList(
        'searchHistory', previousSearchHistory);
    sHistory = prefs.getStringList('searchHistory')!;
    notifyListeners();
  }
  
  }

  void removeFrmHistory({required String searchKeyWord}) async {
    sHistory.remove(searchKeyWord);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('searchHistory', sHistory);
    notifyListeners();
  }
}
