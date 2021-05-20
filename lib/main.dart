import 'package:alicespt/app/modules/auction/auction_binding.dart';
import 'package:alicespt/app/modules/auction/auction_page.dart';
import 'package:alicespt/resources/values/ui_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(GetMaterialApp(
      title: 'Tibia Auctions',
      defaultTransition: Transition.leftToRight,
      getPages: [
        // GetPage(
        //   name: UIRoutes.HOME,
        //   binding: HomeBinding(),
        //   page: () => HomePage(),
        // ),
        GetPage(
          name: UIRoutes.CURRENT_AUCTIONS,
          binding: AuctionBinding(),
          page: () => AuctionPage(),
        ),
      ],
    ));
