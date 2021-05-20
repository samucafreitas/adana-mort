import 'package:alicespt/app/data/repository/adapters/auction_repository_adapter.dart';
import 'package:alicespt/app/data/repository/auction_repository.dart';
import 'package:alicespt/app/modules/auction/auction_controller.dart';
import 'package:get/get.dart';

class AuctionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuctionRepository>(() => AuctionRepository());
    Get.lazyPut<AuctionController>(
        () => AuctionController(auctionRepository: Get.find()));
  }
}
