import 'package:flutter/material.dart';

class Dataprovider with ChangeNotifier {
  String _data = ''; // Non-nullable, initialized with empty string

  String get data => _data;

  void updateData(String newData) {
    _data = newData;
    notifyListeners();
  }
}
