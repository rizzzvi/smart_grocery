import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smart_grocery/screens/routes.dart';

class PaymentDetailsScreen extends StatelessWidget {
  TextEditingController expiryDateTxt = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Payment Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: 109,
                      child: TextFormField(
                        validator: (value) {
                          String val = value.toString();
                          if (val.length < 14) {
                            return 'This is an invalid card number';
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(14),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Card Number',
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, height: 1),
                    Container(
                      height: 110,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextFormField(
                              validator: (value) {
                                String val = value.toString();
                                if (val.length < 4) {
                                  return 'Invalid Expiry Date';
                                }
                                if (val.contains('/')) {
                                  List<String> dateData = val.split('/');
                                  if (double.parse(dateData[0]) <
                                          DateTime.now().month ||
                                      double.parse(dateData[1]) <
                                          double.parse(DateTime.now()
                                              .year
                                              .toString()
                                              .split('0')[1]) ||
                                      val.length < 4 ||
                                      double.parse(dateData[0]) > 12) {
                                    return 'Invalid Expiry Date';
                                  }
                                }
                              },

                              //   int currentMonth = DateTime.now().month;
                              //   int currentYear = DateTime.now().year;
                              //   print(dateData[0]);
                              //   // int expireMonth = int.parse(dateData[0]);
                              //   // int expireYear =
                              //   //     int.parse(dateData[1].split('0')[1]);
                              //   // print('Exp ' + expireYear.toString());

                              //   /
                              // },
                              inputFormatters: [
                                MaskTextInputFormatter(mask: '##/##'),
                                // FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(5),
                              ],
                              decoration: InputDecoration(
                                labelText: 'Expire Date (MM/YY)',
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.grey,
                            width: 1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.39,
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              validator: (value) {
                                String val = value.toString();
                                if (val.length != 3) {
                                  return 'This is an invalid cvv';
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.075),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '14 SR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 24),
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context)
                            .pushNamed(Routes.paymentConfirmationRoute);
                      }
                    },
                    child: Text('Confirm Order')),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
