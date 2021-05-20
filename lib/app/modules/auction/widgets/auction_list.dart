import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

auctionList(context, state) => Container(
      child: ListView.builder(
        itemCount: state.length,
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFFD4C0A1),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF875F3E).withOpacity(0.9),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          state[index].charName,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 15, color: const Color(0xFF004294)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10, top: 2),
                        child: Text(
                          state[index].charInfo,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13, color: const Color(0xFF5A2800)),
                        ),
                      ),
                      Container(
                        color: const Color(0xFFD4C0A1),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 86,
                              width: 86,
                              margin: EdgeInsets.only(
                                  right: 0, left: 10, bottom: 10),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF1E0C6),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 9,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: state[index].auctionOutfit,
                              ),
                            ),
                            boxItems(state[index].auctionItemsViewBox),
                            Expanded(
                              child: Container(
                                height: 86,
                                margin: EdgeInsets.only(
                                    left: 0, right: 10, bottom: 10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF1E0C6),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 9,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible:
                                          MediaQuery.of(context).size.width >
                                              410,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Text(
                                          "Current Bid",
                                          style: TextStyle(
                                              color: const Color(0xFF5A2800),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Text(
                                            state[index].auctionBid,
                                            style: TextStyle(
                                                color: const Color(0xFF5A2800),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/icon-tibiacoin.png'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

boxItems(List<String> auctionItemsViewBox) => Container(
      margin: EdgeInsets.only(right: 3, left: 3, bottom: 10),
      padding: EdgeInsets.all(3.0),
      width: 86,
      height: 86,
      decoration: BoxDecoration(
          color: const Color(0xFFF1E0C6),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 9,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: const Color(0xFFF1E0C6),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.horizontal(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Visibility(
                  visible: auctionItemsViewBox[0] !=
                      '(no item for display selected)',
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: auctionItemsViewBox[0],
                  ),
                ),
              ),
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: const Color(0xFFF1E0C6),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.horizontal(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Visibility(
                  visible: auctionItemsViewBox[1] !=
                      '(no item for display selected)',
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: auctionItemsViewBox[1],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: const Color(0xFFF1E0C6),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.horizontal(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Visibility(
                  visible: auctionItemsViewBox[2] !=
                      '(no item for display selected)',
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: auctionItemsViewBox[2],
                  ),
                ),
              ),
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: const Color(0xFFF1E0C6),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.horizontal(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Visibility(
                  visible: auctionItemsViewBox[3] !=
                      '(no item for display selected)',
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: auctionItemsViewBox[3],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
