import 'package:alicespt/app/data/models/auction.dart';

abstract class IAuctionRepository {
  Future<List<Auction>> currentAuctions(FilterAuctions filter);
  Future<int> auctionsLastPage(FilterAuctions filter);
}
