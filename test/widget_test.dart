import 'package:alicespt/app/modules/auction/auction_binding.dart';
import 'package:alicespt/app/modules/auction/auction_page.dart';
import 'package:alicespt/resources/values/ui_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/route_manager.dart';

void main() {
  testWidgets('Current Auctions Page', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      getPages: [
        GetPage(
          name: UIRoutes.CURRENT_AUCTIONS,
          binding: AuctionBinding(),
          page: () => AuctionPage(),
        ),
      ],
    ));

    await tester.tap(find.byIcon(Icons.filter_list));
    expect(find.text('Current Auctions'), findsOneWidget);
  });
}
