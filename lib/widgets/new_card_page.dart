import 'dart:ui';

import 'package:bank_app/data/local/bank_cart_model.dart';
import 'package:flutter/material.dart';

class NewCardPage extends StatelessWidget {
  final double value, maxHeight, maxWidth;
  final bool isView;

  final void Function(DragUpdateDetails details)? onVerticalDragUpdate;
  final void Function(DragEndDetails details)? onVerticalDragEnd;
  final VoidCallback? onTapBtnClose;

  const NewCardPage(
      {Key? key,
      required this.value,
      required this.maxHeight,
      required this.maxWidth,
      this.isView = false,
      this.onVerticalDragUpdate,
      this.onVerticalDragEnd,
      this.onTapBtnClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight,
      width: maxWidth,
      child: Padding(
        padding: EdgeInsets.all(
          lerpDouble(20, 0, value)!,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(lerpDouble(30, 0, value)!)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "aly",
                        style: TextStyle(
                            fontSize: 40

                            ///lerpDouble(35, 20, value)!
                            ,
                            color: Colors.deepPurple),
                        children: [
                          TextSpan(
                              text: " HD",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Container(
                    width: lerpDouble(75, 50, value),
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: CircleAvatar(
                            maxRadius: 25,
                            backgroundColor: Colors.grey.shade100,
                            backgroundImage: AssetImage(
                              cards[1]!.image.toString(),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Opacity(
                            opacity: lerpDouble(1, 0, value)!,
                            child: CircleAvatar(
                              maxRadius: 25,
                              backgroundColor: Colors.white,
                              child: Center(
                                child: Icon(
                                  Icons.payment,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Flexible(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemExtent: (MediaQuery.of(context).size.width / 5) -
                          lerpDouble(0, 10, value)!,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      itemCount: User.listUser.length,
                      itemBuilder: (context, item) {
                        final widthChild =
                            (MediaQuery.of(context).size.width / 5 -
                                lerpDouble(0, 10, value)!);
                        return FittedBox(
                          child: item == 0
                              ? Column(
                                  children: [
                                    CircleAvatar(
                                      child: Center(
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "search",
                                      style: TextStyle(color: Colors.purple),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage(User.listUser[item].img),
                                    ),
                                    Text(
                                      User.listUser[item].id.toString(),
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                    if (value > 0.3)
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    Flexible(
                                      flex: 1,
                                      child: value <= 0.2
                                          ? SizedBox.shrink()
                                          : Opacity(
                                              opacity: value,
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                padding: EdgeInsets.all(10),
                                                alignment: Alignment.centerLeft,
                                                child: FittedBox(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.purple,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        20),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .purple,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30)),
                                                            child: Text(
                                                              "holiday goal",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .purple),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "\$100 \$5000",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .purple,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 25),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    if (value >= 0.3)
                                      SizedBox(
                                        height: 20,
                                      ),

                                    ///card for ...
                                    Flexible(
                                        flex: 3,
                                        child: value <= 0.2
                                            ? SizedBox.shrink()
                                            : Opacity(
                                                opacity: value,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: Colors.white),
                                                  padding: EdgeInsets.all(10),
                                                  margin: EdgeInsets.only(
                                                      bottom: 20),
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      if (value >= 0.6) ...[
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .credit_card,
                                                                  size: 50,
                                                                  color: Colors
                                                                      .purple,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "pay for services",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .purple),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .credit_card,
                                                                  size: 50,
                                                                  color: Colors
                                                                      .purple,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "TAKE A LOAN",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .purple),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "4%",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .purple),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      Expanded(
                                                          flex: 3,
                                                          child:
                                                              GestureDetector(
                                                            onVerticalDragUpdate:
                                                                onVerticalDragUpdate,
                                                            onVerticalDragEnd:
                                                                onVerticalDragEnd,
                                                            child: InkWell(
                                                              onTap:
                                                                  onTapBtnClose,
                                                              child: Container(
                                                                width: 50,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .purple,
                                                                    shape: BoxShape
                                                                        .circle),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Icon(
                                                                  Icons
                                                                      .more_horiz,
                                                                  color: Colors
                                                                      .purple,
                                                                  size: 40,
                                                                ),
                                                              ),
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ))
                                  ],
                                ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
