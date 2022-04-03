import 'package:flutter/foundation.dart';

class DataProvider extends ChangeNotifier {
  final dataList = [
    {
      'id': 1,
      'image': 'image',
      'title': 'Apples',
      'price': '10\$',
    },
    {
      'id': 2,
      'image': 'image',
      'title': 'Milk',
      'price': '4\$',
    },
    {
      'id': 3,
      'image': 'image',
      'title': 'Eggs',
      'price': '9\$',
    },
  ];
  int numberOfItems = 0;
  updateCartItems() {
    numberOfItems++;
    notifyListeners();
  }
}
