import 'package:alicespt/app/modules/auction/auction_controller.dart';
import 'package:alicespt/app/modules/auction/widgets/auction_list.dart';
import 'package:alicespt/app/modules/auction/widgets/filter_widgets.dart';
import 'package:alicespt/app/modules/auction/widgets/pagination_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuctionPage extends GetView<AuctionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1E0C6),
      appBar: AppBar(
        title: Text('Current Auctions'),
        backgroundColor: const Color(0xFF5A2800),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Show Filter',
            onPressed: () async {
              filterAuctionDialog(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          paginationBar(),
          Expanded(
            child: controller.obx(
              (state) {
                return auctionList(context, state);
              },
              onError: (error) => Container(
                child: Text("Houve um erro => " + error!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
