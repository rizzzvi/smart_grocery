import 'package:flutter/foundation.dart';

class DataProvider extends ChangeNotifier {
  var cartItems = [];
  double totalBill = 0.0;

  final dataList = [
    {
      'id': 1,
      'image':
          'https://cdn.metro-online.pk/dashboard/prod-pic/LHE-01262/12620038-0-M.jpg?5',
      'title': '7 DAYS BAKE ROLL PIZZ 36 GM',
      'price': 1.00,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'PERFETTO PASTA ELICHE',
      'price': 5.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'MAGGI SOUP CHICKEN NOODLE',
      'price': 4.25,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'BUITONI NOCCIOLE',
      'price': 8.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'MCTVI DIG NIBLE DOUBLE CHO 110G',
      'price': 9.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'SNICKERS STANDARD',
      'price': 3.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'MAZOLA MAYONNAISE SQZ',
      'price': 13.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'DELICIO S/DRSNG FRENCH',
      'price': 17.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'CHEETOS CRUNCHY FLAMING HOT',
      'price': 8.25,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'GM BUGLES CORN SNCK',
      'price': 7.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'FOLGERS COFFEE CLASS',
      'price': 38.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'PANZANI PIPE REGATTE PASTA',
      'price': 10.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'FITNESS TOMATO HERBS36G',
      'price': 3.25,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'RAINBOW EVAP MILK L/FAT',
      'price': 3.95,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'TABASCO HABANRO HOT SAUCE',
      'price': 17.25,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'QUACKER WHITE OATS TIN',
      'price': 10.75,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'NADEC CREAM TIN',
      'price': 4.50,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'RIOMARE SALATUNA BEANS RCP2PC',
      'price': 34.50,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'TCHIBO GOLD CAFE',
      'price': 22.50,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'NESTLE CNTRY CRNFLAKES500',
      'price': 19.75,
    },
    // {
    //   'id': 3,
    //   'image': 'image',
    //   'title': 'Eggs',
    //   'price': '9\$',
    // },
  ];
  int numberOfItems = 0;
  updateCartItems(String? code) {
    numberOfItems++;
    if (code == '1.00') cartItems.insert(0, dataList[0]);
    if (code == '5.95') cartItems.insert(0, dataList[1]);
    if (code == '4.25') cartItems.insert(0, dataList[2]);
    if (code == '8.95') cartItems.insert(0, dataList[3]);
    if (code == '9.95') cartItems.insert(0, dataList[4]);
    if (code == '3.95') cartItems.insert(0, dataList[5]);
    if (code == '13.95') cartItems.insert(0, dataList[6]);
    if (code == '17.95') cartItems.insert(0, dataList[7]);
    if (code == '8.25') cartItems.insert(0, dataList[8]);
    if (code == '7.95') cartItems.insert(0, dataList[9]);
    if (code == '38.95') cartItems.insert(0, dataList[10]);
    if (code == '10.95') cartItems.insert(0, dataList[11]);
    if (code == '3.25') cartItems.insert(0, dataList[12]);
    if (code == '3.95') cartItems.insert(0, dataList[13]);
    if (code == '17.25') cartItems.insert(0, dataList[14]);
    if (code == '10.75') cartItems.insert(0, dataList[15]);
    if (code == '4.50') cartItems.insert(0, dataList[16]);
    if (code == '34.50') cartItems.insert(0, dataList[17]);
    if (code == '22.50') cartItems.insert(0, dataList[18]);
    if (code == '19.75') cartItems.insert(0, dataList[19]);

    // if (numberOfItems > 0) {
    //   if (numberOfItems.isEven) {
    //     cartItems.insert(
    //       0,
    //       dataList[0],
    //     );
    //   } else {
    //     cartItems.insert(
    //       0,
    //       dataList[1],
    //     );
    //   }
    // }
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
