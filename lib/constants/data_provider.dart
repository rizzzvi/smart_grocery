import 'package:flutter/foundation.dart';

class DataProvider extends ChangeNotifier {
  var cartItems = [];
  double totalBill = 0.0;

  final dataList = [
    {
      'id': 1,
      'image':
          'https://cdn.metro-online.pk/dashboard/prod-pic/LHE-01262/12620038-0-M.jpg?5',
      'title': 'Apples',
      'price': 10,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Milk',
      'price': 4,
    },
    // {
    //   'id': 3,
    //   'image': 'image',
    //   'title': 'Eggs',
    //   'price': '9\$',
    // },
  ];
  int numberOfItems = 0;
  updateCartItems() {
    numberOfItems++;
    if (numberOfItems > 0) {
      if (numberOfItems.isEven) {
        cartItems.insert(
          0,
          dataList[0],
        );
      } else {
        cartItems.insert(
          0,
          dataList[1],
        );
      }
    }
    notifyListeners();
  }

  calculateTotalBill() {
    for (int i = 0; i < cartItems.length; i++) {
      totalBill = totalBill + cartItems[i]['price'];
    }
  }

  void clearCart() {
    totalBill = 0;
    numberOfItems = 0;
    cartItems.clear();
    notifyListeners();
  }
}
