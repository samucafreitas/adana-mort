class Auction {
  // Char infos: Name, lvl...
  String charName = '';
  String? auctionOutfit = '';
  String charInfo = '';
  List<String> auctionItemsViewBox = [];
  String auctionBid = '';
}

// TODO: SearchType, OrdemColumn, OrderDirection, filterSkillId
class FilterAuctions {
  int filterProfession = 666;
  int filterLevelRangeFrom = 0;
  int filterLevelRangeTo = 0;
  String filterWorld = '(all Worlds)';
  int filterWorldPvpType = 666;
  int filterWorldBattlEyeState = 0;
  int filterSkillId = 0;
  int filterSkillRangeFrom = 0;
  int filterSkillRangeTo = 0;
  int orderColumn = 101;
  int orderDirection = 1; // lowest / earliest
  int currentPage = 1; // highest / latest

  String toQuery() {
    return '?subtopic=currentcharactertrades'
        '&filter_profession=$filterProfession'
        '&filter_levelrangefrom=$filterLevelRangeFrom'
        '&filter_levelrangeto=$filterLevelRangeTo'
        '&filter_world=$filterWorld'
        '&filter_worldpvptype=$filterWorldPvpType'
        '&filter_worldbattleyestate=$filterWorldBattlEyeState'
        '&filter_skillid=$filterSkillId'
        '&filter_skillrangefrom=$filterSkillRangeFrom'
        '&filter_skillrangeto=$filterSkillRangeTo'
        '&order_column=$orderColumn'
        '&order_direction=$orderDirection'
        '&currentpage=$currentPage';
  }
}
