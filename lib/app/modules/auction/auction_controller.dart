import 'package:alicespt/app/data/models/auction.dart';
import 'package:alicespt/app/data/repository/adapters/auction_repository_adapter.dart';
import 'package:get/get.dart';

class AuctionController extends SuperController<List<Auction>> {
  final IAuctionRepository auctionRepository;
  final _filterAuctions = FilterAuctions();
  var currentPage = 1.obs;
  var lastPage = 1.obs;

  AuctionController({required this.auctionRepository});

  @override
  void onInit() {
    super.onInit();
    updateLastPage();
    append(() => () => auctionRepository.currentAuctions(_filterAuctions));
  }

  FilterAuctions get filterAuctions => _filterAuctions;

  void updateLastPage() async {
    lastPage.value = await auctionRepository.auctionsLastPage(_filterAuctions);
  }

  void filterTibiaAuctions() {
    change([], status: RxStatus.loading());
    currentPage.value = 1;
    updateLastPage();
    append(() => () => auctionRepository.currentAuctions(_filterAuctions));
  }

  void previousPage() {
    if (_filterAuctions.currentPage > 1) {
      change([], status: RxStatus.loading());
      _filterAuctions.currentPage--;
      updateCurrentAuctions();
    }
  }

  void nextPage() {
    if (_filterAuctions.currentPage < lastPage.value) {
      change([], status: RxStatus.loading());
      _filterAuctions.currentPage++;
      updateCurrentAuctions();
    }
  }

  void updateCurrentAuctions() {
    currentPage.value = _filterAuctions.currentPage;
    append(() => () => auctionRepository.currentAuctions(_filterAuctions));
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }
}
