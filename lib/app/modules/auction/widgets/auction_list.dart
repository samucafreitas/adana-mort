import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

auctionList(context, state) => Container(
      child: ListView.builder(
        itemCount: state.length,
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
          child: Container(
            decoration: genBoxDecoration(
              Color(0xFFD4C0A1),
              BorderRadius.circular(6),
              Color(0xFF875F3E).withOpacity(0.9),
            ),
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
                            boxCharImg(state[index].auctionOutfit),
                            boxCharItems(state[index].auctionItemsViewBox),
                            boxCharBid(context, state[index].auctionBid),
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

boxCharImg(charImgURL) => Container(
      height: 86,
      width: 86,
      margin: EdgeInsets.only(right: 0, left: 10, bottom: 10),
      padding: EdgeInsets.all(10.0),
      decoration: genBoxDecoration(
        Color(0xFFF1E0C6),
        BorderRadius.circular(6),
        Colors.black.withOpacity(0.3),
      ),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: charImgURL,
      ),
    );

boxCharItems(List<String> auctionItemsViewBox) => Container(
      margin: EdgeInsets.only(right: 3, left: 3, bottom: 10),
      padding: EdgeInsets.all(3.0),
      width: 86,
      height: 86,
      decoration: genBoxDecoration(
        Color(0xFFF1E0C6),
        BorderRadius.circular(6),
        Colors.black.withOpacity(0.3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              itemWidget(auctionItemsViewBox[0]),
              itemWidget(auctionItemsViewBox[1]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              itemWidget(auctionItemsViewBox[2]),
              itemWidget(auctionItemsViewBox[3]),
            ],
          )
        ],
      ),
    );

itemWidget(imageURL) => Container(
      height: 38,
      width: 38,
      decoration: genBoxDecoration(
        Color(0xFFF1E0C6),
        BorderRadius.horizontal(),
        Colors.black.withOpacity(0.3),
      ),
      child: Visibility(
        visible: imageURL != '(no item for display selected)',
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageURL,
        ),
      ),
    );

boxCharBid(context, auctionBid) => Expanded(
      child: Container(
        height: 86,
        margin: EdgeInsets.only(left: 0, right: 10, bottom: 10),
        padding: EdgeInsets.all(10.0),
        decoration: genBoxDecoration(
          Color(0xFFF1E0C6),
          BorderRadius.circular(6),
          Colors.black.withOpacity(0.3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: MediaQuery.of(context).size.width > 410,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
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
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    auctionBid,
                    style: TextStyle(
                        color: const Color(0xFF5A2800),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/icon-tibiacoin.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );

genBoxDecoration(boxDecColor, borderRad, boxShaColor) => BoxDecoration(
        color: boxDecColor,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: borderRad,
        boxShadow: [
          BoxShadow(
            color: boxShaColor,
            spreadRadius: 1,
            blurRadius: 9,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]);
