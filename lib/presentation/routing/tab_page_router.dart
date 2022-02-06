import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simpleclub_challenge/presentation/models/item_model.dart';
import 'package:simpleclub_challenge/presentation/pages/home/item_info_view.dart';
import 'package:simpleclub_challenge/utils/app_extensions.dart';

const itemInfoViewRouteName = 'tabPageRoute';

class TabPageRouter {
  TabPageRouter(this.baseItem, this.items);

  final ItemModel baseItem;
  final List<ItemModel> items;

  Route<dynamic> generateTabRoute(RouteSettings settings) {
    if (settings.name != null && settings.name!.contains('/')) {
      String itemId = settings.name!.split('/').last;
      ItemModel? itemModel = items.firstWhereOrNull((item) => item.id == itemId);
      if (itemModel != null) {
        ItemModel? openedFromItem;
        debugPrint('${settings.arguments != null} ${settings.arguments}');
        if (settings.arguments != null && settings.arguments is ItemInfoViewArgs) {
          openedFromItem = (settings.arguments as ItemInfoViewArgs).openedFromItem;
          debugPrint('openedFromItem = $openedFromItem');
        }
        return CupertinoPageRoute(builder: (_) => ItemInfoView(item: itemModel, openedFromItem: openedFromItem), fullscreenDialog: true);
      }
    }
    return CupertinoPageRoute(
        builder: (context) => Container(
            color: Color(0xFFF9F9F9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Item not found'),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Return')),
              ],
            )),
        fullscreenDialog: true);
  }
}
