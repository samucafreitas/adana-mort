import 'package:alicespt/app/data/models/auction.dart';
import 'package:alicespt/app/data/repository/adapters/auction_repository_adapter.dart';
import 'package:alicespt/resources/values/constants.dart';
import 'package:web_scraper/web_scraper.dart';

class AuctionRepository implements IAuctionRepository {
  final ws = WebScraper(URL_BASE);
  final itemsAmount = 4;
  int _auctionsLastPage = 0;

  @override
  Future<int> auctionsLastPage(FilterAuctions filter) async {
    if (await ws.loadWebPage('/charactertrade/' + filter.toQuery())) {
      final auctionsCount = ws.getElementTitle(
          '''td.PageNavigation > small > div:nth-child(1) > b''');

      if (auctionsCount.isNotEmpty) {
        _auctionsLastPage = (int.parse(auctionsCount[0]
                    .replaceAll(RegExp('» Results: '), '')
                    .replaceAll(',', '')) /
                25)
            .ceil();
      }
    }

    return _auctionsLastPage;
  }

  @override
  Future<List<Auction>> currentAuctions(FilterAuctions filter) async {
    final List<Auction> auctionList = [];

    if (await ws.loadWebPage('/charactertrade/' + filter.toQuery())) {
      final charsNames = ws.getElementTitle('''div.AuctionCharacterName > a''');
      final charsInfos = ws.getElementTitle('''div.AuctionHeader''');
      final charsImgs =
          ws.getElementAttribute('''img.AuctionOutfitImage''', 'src');
      final charsItemBox = ws.getElementAttribute(
          '''div.AuctionBodyBlock.AuctionDisplay.AuctionItemsViewBox > div ''',
          'title');
      final charsItemBoxImg = ws.getElementAttribute(
          '''div.AuctionBodyBlock.AuctionDisplay.AuctionItemsViewBox > div > img ''',
          'src');
      final auctionsCount = ws.getElementTitle(
          '''td.PageNavigation > small > div:nth-child(1) > b''');
      final auctionsBid =
          ws.getElementTitle('''div.ShortAuctionDataValue > b''');

      if (auctionsCount.isNotEmpty) {
        _auctionsLastPage = (int.parse(auctionsCount[0]
                    .replaceAll(RegExp('» Results: '), '')
                    .replaceAll(',', '')) /
                25)
            .ceil();
      }

      var itemNameIndex = 0, itemImgIndex = 0;
      for (var name in charsNames) {
        final auction = Auction();
        auction.charName = name;
        auction.charInfo = charsInfos[charsNames.indexOf(name)]
            .replaceAll(RegExp('^.*Level'), 'Level');
        auction.auctionOutfit = charsImgs[charsNames.indexOf(name)];
        auction.auctionBid = auctionsBid[charsNames.indexOf(name)];
        // Populate itemsBox
        for (var i = 0; i < itemsAmount; i++) {
          if (charsItemBox[itemNameIndex] != '(no item for display selected)') {
            auction.auctionItemsViewBox.add(charsItemBoxImg[itemImgIndex]!);
            itemImgIndex++;
          } else {
            auction.auctionItemsViewBox.add(charsItemBox[itemNameIndex]!);
          }
          itemNameIndex++;
        }
        auctionList.add(auction);
      }

      return auctionList;
    }

    return [];
  }
}
