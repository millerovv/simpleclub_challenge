import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simpleclub_challenge/presentation/models/item_model.dart';
import 'package:simpleclub_challenge/presentation/pages/home/item_info_view.dart';
import 'package:simpleclub_challenge/presentation/theme/app_theme.dart';
import 'package:simpleclub_challenge/utils/app_extensions.dart';

const itemInfoViewRouteName = 'tabPageRoute';

class TabPageRouter {
  TabPageRouter(this.baseItemViewKey, this.baseItem, this.items);

  final GlobalKey<ItemInfoViewState> baseItemViewKey;
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
        }
        return CupertinoPageRoute(
            builder: (_) => ItemInfoView(
                key: itemModel == baseItem ? baseItemViewKey : ValueKey('item_info_view_${itemModel.id}'),
                item: itemModel,
                openedFromItem: openedFromItem),
            fullscreenDialog: true);
      }
    }
    return CupertinoPageRoute(
        builder: (context) => Container(
            color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Item not found'),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Return')),
              ],
            )),
        fullscreenDialog: true);
  }
}
