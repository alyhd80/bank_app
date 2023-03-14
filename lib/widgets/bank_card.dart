import 'package:flutter/material.dart';

import '../data/local/bank_cart_model.dart';

class BankCard extends StatelessWidget {
  BankCardModel bankCardModel;

  BankCard({Key? key, required this.bankCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),

      child: Image.asset(
        bankCardModel.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
