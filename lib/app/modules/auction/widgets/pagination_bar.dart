import 'package:alicespt/app/modules/auction/auction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

paginationBar() {
  AuctionController controller = Get.find();

  return Container(
    height: 40,
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Show Filter',
          onPressed: () {
            controller.previousPage();
          },
        ),
        Container(
          child: Obx(
            () {
              return Text(
                '${controller.currentPage} de ${controller.lastPage}',
                style: TextStyle(
                  color: const Color(0xFF5A2800),
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          tooltip: 'Show Filter',
          onPressed: () {
            controller.nextPage();
          },
        )
      ],
    ),
  );
}
