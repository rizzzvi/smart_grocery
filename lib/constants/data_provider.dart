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
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Carrot 1kg',
      'price': 4,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Italian Spinach',
      'price': 13,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Cucumber',
      'price': 22,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Rosemary italian',
      'price': 13,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Ocimum',
      'price': 2,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Green onion',
      'price': 2,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Red radish',
      'price': 2,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Parsely',
      'price': 3,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Lemon',
      'price': 9,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Tomato',
      'price': 18,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Box of banana',
      'price': 25,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Broccoli',
      'price': 5,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Blueberry',
      'price': 15,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Green grape',
      'price': 20,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'American strawberry',
      'price': 35,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Red grape one kilo',
      'price': 23,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Eggplant 1kg',
      'price': 4,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Potato ',
      'price': 14,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Yemen mango',
      'price': 37,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Pomegranate',
      'price': 5,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Red apple 1kg',
      'price': 32,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Green apple',
      'price': 10,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Peach',
      'price': 25,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Thailand pineapple',
      'price': 33,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Zucchini',
      'price': 40,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Melon',
      'price': 37,
    },
    {
      'id': 2,
      'image':
          'https://image.shutterstock.com/image-vector/full-cream-milk-packaging-carton-600w-1577417464.jpg',
      'title': 'Cauliflower',
      'price': 7,
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
    if (code == '100016') cartItems.insert(0, dataList[20]);
    if (code == '145268') cartItems.insert(0, dataList[21]);
    if (code == '1000001') cartItems.insert(0, dataList[22]);
    if (code == '145264') cartItems.insert(0, dataList[23]);
    if (code == '10058') cartItems.insert(0, dataList[24]);
    if (code == '10062') cartItems.insert(0, dataList[25]);
    if (code == '147785') cartItems.insert(0, dataList[26]);
    if (code == '10057') cartItems.insert(0, dataList[27]);
    if (code == '10065') cartItems.insert(0, dataList[28]);
    if (code == '100002') cartItems.insert(0, dataList[29]);
    if (code == '112348') cartItems.insert(0, dataList[30]);
    if (code == '10080') cartItems.insert(0, dataList[31]);
    if (code == '124587') cartItems.insert(0, dataList[32]);
    if (code == '2010018') cartItems.insert(0, dataList[33]);
    if (code == '147558') cartItems.insert(0, dataList[34]);
    if (code == '1090') cartItems.insert(0, dataList[35]);
    if (code == '100092') cartItems.insert(0, dataList[36]);
    if (code == '100025') cartItems.insert(0, dataList[37]);
    if (code == '1000013') cartItems.insert(0, dataList[38]);
    if (code == '147788') cartItems.insert(0, dataList[39]);
    if (code == '100054') cartItems.insert(0, dataList[40]);
    if (code == '100037') cartItems.insert(0, dataList[41]);
    if (code == '147783') cartItems.insert(0, dataList[42]);
    if (code == '100410') cartItems.insert(0, dataList[43]);
    if (code == '1031') cartItems.insert(0, dataList[44]);
    if (code == '100033') cartItems.insert(0, dataList[45]);
    if (code == '100018') cartItems.insert(0, dataList[46]);

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
