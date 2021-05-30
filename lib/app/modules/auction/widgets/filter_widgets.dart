import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auction_controller.dart';

filterAuctionDialog(context) => showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      AuctionController controller = Get.find();

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            insetPadding: EdgeInsets.all(10),
            backgroundColor: const Color(0xFFF1E0C6),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "Filter Auctions",
                      style: TextStyle(
                          color: const Color(0xFF5A2800),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "By character",
                      style: TextStyle(
                          color: const Color(0xFF5A2800),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: worldDropDown()),
                      Container(
                        child: worldPvpTypeDropDown(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: worldBattlEyeStateDropDown(),
                      ),
                      Container(
                        child: professionDropDown(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: minCharLevelInput(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: maxCharLevelInput(),
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Sort by",
                      style: TextStyle(
                          color: const Color(0xFF5A2800),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: orderColumnDropDown(),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: orderDirectionDropDown(),
                      ),
                    ],
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        controller.filterTibiaAuctions();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10, top: 10),
                        color: const Color(0xFF5A2800),
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });

maxCharLevelInput() {
  AuctionController controller = Get.find();

  return TextFormField(
    // initialValue: controller.filterAuctions.filterLevelRangeTo.toString(),
    decoration: const InputDecoration(
      hintText: '(max level)',
    ),
    onChanged: (value) {
      if (value.isNotEmpty) {
        controller.filterAuctions.filterLevelRangeTo = int.parse(value);
      } else {
        controller.filterAuctions.filterLevelRangeTo = 0;
      }
    },
  );
}

minCharLevelInput() {
  AuctionController controller = Get.find();

  return TextFormField(
    //initialValue: controller.filterAuctions.filterLevelRangeFrom.toString(),
    decoration: const InputDecoration(
      hintText: '(min level)',
    ),
    onChanged: (value) {
      if (value.isNotEmpty) {
        controller.filterAuctions.filterLevelRangeFrom = int.parse(value);
      } else {
        controller.filterAuctions.filterLevelRangeFrom = 0;
      }
    },
  );
}

professionDropDown() {
  AuctionController controller = Get.find();

  final Map<String, int> professions = {
    '(all Vocations)': 666,
    'None': 1,
    'Druid': 2,
    'Knight': 3,
    'Paladin': 4,
    'Sorcerer': 5,
  };

  return controller.obx((_) => DropdownButton<int>(
        value: controller.filterAuctions.filterProfession,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: const Color(0xFF5A2800)),
        underline: Container(
          height: 2,
          color: const Color(0xFF5A2800),
        ),
        onChanged: (int? newValue) {
          controller.filterAuctions.filterProfession = newValue!;
          controller.update();
        },
        items: professions
            .map((String k, v) {
              return MapEntry(
                k,
                DropdownMenuItem<int>(
                  value: v,
                  child: Text(k),
                ),
              );
            })
            .values
            .toList(),
      ));
}

worldPvpTypeDropDown() {
  AuctionController controller = Get.find();

  final Map<String, int> pvpTypes = {
    '(All PvP Types)': 666,
    'Open PVP': 0,
    'Optional PvP': 1,
    'Hardcore PvP': 2,
    'Retro Open PvP': 3,
    'Retro Hardcore PvP': 4,
  };

  return controller.obx((_) => DropdownButton<int>(
        value: controller.filterAuctions.filterWorldPvpType,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: const Color(0xFF5A2800)),
        underline: Container(
          height: 2,
          color: const Color(0xFF5A2800),
        ),
        onChanged: (int? newValue) {
          controller.filterAuctions.filterWorldPvpType = newValue!;
          controller.update();
        },
        items: pvpTypes
            .map((String k, v) {
              return MapEntry(
                k,
                DropdownMenuItem<int>(
                  value: v,
                  child: Text(k),
                ),
              );
            })
            .values
            .toList(),
      ));
}

worldBattlEyeStateDropDown() {
  AuctionController controller = Get.find();

  final Map<String, int> battlEyeState = {
    '(BattlEye: all)': 0,
    'initially protected': 1,
    'protected': 2,
    'not protected': 3,
  };

  return controller.obx((_) => DropdownButton<int>(
        value: controller.filterAuctions.filterWorldBattlEyeState,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: const Color(0xFF5A2800)),
        underline: Container(
          height: 2,
          color: const Color(0xFF5A2800),
        ),
        onChanged: (int? newValue) {
          controller.filterAuctions.filterWorldBattlEyeState = newValue!;
          controller.update();
        },
        items: battlEyeState
            .map((String k, v) {
              return MapEntry(
                k,
                DropdownMenuItem<int>(
                  value: v,
                  child: Text(k),
                ),
              );
            })
            .values
            .toList(),
      ));
}

worldDropDown() {
  AuctionController controller = Get.find();
  return controller.obx((state) => DropdownButton<String>(
        value: controller.filterAuctions.filterWorld,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: const Color(0xFF5A2800)),
        underline: Container(
          height: 2,
          color: const Color(0xFF5A2800),
        ),
        onChanged: (String? newValue) {
          controller.filterAuctions.filterWorld = newValue!;
          controller.update();
        },
        items: <String>['(all Worlds)', 'Adra', 'Lobera', 'Antica', 'Peloria']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ));
}

orderColumnDropDown() {
  AuctionController controller = Get.find();

  final Map<String, int> orderColumn = {
    'Bid': 100,
    'End Date': 101,
    'Start Date': 103,
    'Character Level': 102,
    'Axe Fighting': 10,
    'Club Fighting': 9,
    'Distance Fighting': 7,
    'Fishing': 13,
    'Fist Fighting': 11,
    'Magic Level': 1,
    'Shielding': 6,
    'Sword Fighting': 8,
  };

  return controller.obx((_) => DropdownButton<int>(
        value: controller.filterAuctions.orderColumn,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: const Color(0xFF5A2800)),
        underline: Container(
          height: 2,
          color: const Color(0xFF5A2800),
        ),
        onChanged: (int? newValue) {
          controller.filterAuctions.orderColumn = newValue!;
          controller.update();
        },
        items: orderColumn
            .map((String k, v) {
              return MapEntry(
                k,
                DropdownMenuItem<int>(
                  value: v,
                  child: Text(k),
                ),
              );
            })
            .values
            .toList(),
      ));
}

orderDirectionDropDown() {
  AuctionController controller = Get.find();

  final Map<String, int> orderDirection = {
    'highest / latest': 0,
    'lowest / earliest': 1,
  };

  return controller.obx((_) => DropdownButton<int>(
        value: controller.filterAuctions.orderDirection,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: const Color(0xFF5A2800)),
        underline: Container(
          height: 2,
          color: const Color(0xFF5A2800),
        ),
        onChanged: (int? newValue) {
          controller.filterAuctions.orderDirection = newValue!;
          controller.update();
        },
        items: orderDirection
            .map((String k, v) {
              return MapEntry(
                k,
                DropdownMenuItem<int>(
                  value: v,
                  child: Text(k),
                ),
              );
            })
            .values
            .toList(),
      ));
}
