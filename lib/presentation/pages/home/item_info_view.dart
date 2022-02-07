import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:simpleclub_challenge/presentation/models/item_model.dart';
import 'package:simpleclub_challenge/presentation/routing/tab_page_router.dart';
import 'package:simpleclub_challenge/presentation/theme/app_theme.dart';

class ItemInfoViewArgs {
  ItemInfoViewArgs(this.openedFromItem);

  final ItemModel? openedFromItem;
}

class ItemInfoView extends StatefulWidget {
  const ItemInfoView({Key? key, required this.item, this.openedFromItem}) : super(key: key);

  final ItemModel item;
  final ItemModel? openedFromItem;

  @override
  State<ItemInfoView> createState() => ItemInfoViewState();
}

class ItemInfoViewState extends State<ItemInfoView> {
  Future<bool> maybePop() => Navigator.of(context, rootNavigator: false).maybePop();

  void _onTapLink(BuildContext context, String? href) {
    if (href == null || !href.contains(':')) {
      return;
    }
    final String itemId = href.split(':').last;
    Navigator.pushNamed(context, '$itemInfoViewRouteName/$itemId', arguments: ItemInfoViewArgs(widget.item));
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                if (widget.openedFromItem != null) _buildBackButton(context),
                const SizedBox(height: 8),
                Text(widget.item.title, style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(height: 16),
                if (widget.item.imageUrl != null)
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 250), child: CachedNetworkImage(imageUrl: widget.item.imageUrl!)),
                  )),
                MarkdownBody(data: widget.item.body!, onTapLink: (_, href, __) => _onTapLink(context, href)),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      );

  Widget _buildBackButton(BuildContext context) => InkWell(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
          child: Row(
            children: [
              const Icon(Icons.chevron_left, color: primaryColor),
              Text(widget.openedFromItem!.title,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: primaryColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
}
