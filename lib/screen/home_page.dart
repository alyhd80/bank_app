import 'dart:ui';

import 'package:bank_app/data/local/bank_cart_model.dart';
import 'package:bank_app/widgets/add_card.dart';
import 'package:bank_app/widgets/bank_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/new_card_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ///slider controller
  late AnimationController _animationController;

  ///card controller
  final PageController _pg =
      PageController(viewportFraction: 1, initialPage: 1);

  double page = 1;
  double pageClamp = 1;

  void pageListener() {
    setState(() {
      page = _pg.page!;
      pageClamp = page.clamp(0, 1);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pg.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _pg.removeListener(_statusPage);
    _pg.dispose();
    super.dispose();
  }

  void _statusPage() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final borderRadius = 30;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            if (page < 1.005) ...[
              ///add card background
              Positioned(
                top: pageClamp * size.height * .275,
                bottom: pageClamp * size.height * .275,
                left: pageClamp * size.width * .1,
                right: pageClamp * size.width * .1,
                child: Transform.translate(
                  offset: Offset(
                      page < 1 ? 0 : (-1 * page * size.width + size.width), 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(pageClamp * 30)),
                  ),
                ),
              ),

              ///Add card
              AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: page < 0.3
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20 * 2),
                          child: AddCard(),
                        )
                      : null),
            ],

            ///card list
            Align(
              alignment: Alignment.center,
              child: Container(
                height: size.height * 0.5,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: PageView(
                  controller: _pg,
                  children: cards
                      .map((e) => e == null
                          ? const SizedBox.shrink()
                          : Transform.translate(
                              offset: Offset(
                                  page < 1 ? (1 - pageClamp) * 50 : 0, 0),
                              child: BankCard(bankCardModel: e),
                            ))
                      .toList(),
                ),
              ),
            ),

            ///profile card
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  duration: Duration(milliseconds: 5550),
                  child: pageClamp < .9
                      ? SizedBox.shrink()
                      : Container(
                          height: size.height * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Colors.purpleAccent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.02),
                                  child: FittedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                                text: "Hi",
                                                children: [
                                              TextSpan(text: "aly hd")
                                            ]))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.15,
                                height: size.height * 0.005,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ),

            /// section bottom
            Positioned(
              bottom: 0,
              width: size.width,
              height: size.height * 0.2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  duration: Duration(milliseconds: 100),
                  child: pageClamp < 0.9
                      ? SizedBox.shrink()
                      : TweenAnimationBuilder(
                    key: Key(cards[page.round()]!.image),
                          tween: Tween<double>(begin: 25.0, end: 0.0),
                          duration: Duration(milliseconds: 200),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0, value),
                              child: Container(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    foregroundImage:
                                        AssetImage(cards[page.round()]!.image),
                                  ),
                                  title: Text(
                                      cards[page.round()]!.balance.toString()),
                                  subtitle: Text(cards[page.round()]!.number),
                                ),
                              ),
                            );
                          }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
