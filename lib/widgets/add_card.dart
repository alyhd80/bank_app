import 'package:flutter/material.dart';

import '../data/local/bank_cart_model.dart';

class AddCard extends StatefulWidget {
  AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(child: SizedBox.shrink()),
        Flexible(
          child: Text(
            "Your card number",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
        ),
        Expanded(
            flex: 6,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) => index + 1)
                  .map((e) => Center(
                        child: Text(
                          e.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ))
                  .toList(),
            )),
        Flexible(child: SizedBox.shrink())
      ],
    );
  }
}
