import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:simpleclub_challenge/presentation/models/item_model.dart';
import 'package:simpleclub_challenge/presentation/routing/tab_page_router.dart';

class ItemInfoViewArgs {
  ItemInfoViewArgs(this.openedFromItem);

  final ItemModel? openedFromItem;
}

class ItemInfoView extends StatelessWidget {
  const ItemInfoView({Key? key, required this.item, this.openedFromItem}) : super(key: key);

  final ItemModel item;
  final ItemModel? openedFromItem;

  void _onTapLink(BuildContext context, String? href) {
    if (href == null || !href.contains(':')) {
      return;
    }
    final String itemId = href.split(':').last;
    Navigator.pushNamed(context, '$itemInfoViewRouteName/$itemId', arguments: ItemInfoViewArgs(item));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              if (openedFromItem != null) ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('назад')),
              Text(item.title),
              const SizedBox(height: 8),
              MarkdownBody(data: item.body!, onTapLink: (_, href, __) => _onTapLink(context, href)),
            ],
          ),
        ),
      ),
    );
  }
}
