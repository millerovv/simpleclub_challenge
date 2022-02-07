import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleclub_challenge/presentation/bloc/content_cubit.dart';
import 'package:simpleclub_challenge/presentation/models/item_model.dart';
import 'package:simpleclub_challenge/presentation/models/page_model.dart';
import 'package:simpleclub_challenge/presentation/pages/home/item_info_view.dart';
import 'package:simpleclub_challenge/presentation/routing/tab_page_router.dart';

/// This view contains [Navigator] that lets us perform nested navigation to other items by tapping on [item.body] links
class TabPageView extends StatefulWidget {
  const TabPageView({Key? key, required this.page, required this.item}) : super(key: key);

  final PageModel page;
  final ItemModel item;

  @override
  State<TabPageView> createState() => _TabPageViewState();
}

class _TabPageViewState extends State<TabPageView> with AutomaticKeepAliveClientMixin {
  late ContentCubit _contentCubit;
  late TabPageRouter _tabPageRouter;

  final itemInfoViewKey = GlobalKey<ItemInfoViewState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _contentCubit = context.read();
    final contentState = _contentCubit.state;
    assert(contentState.stateType == ContentStateType.success);
    _tabPageRouter = TabPageRouter(itemInfoViewKey, widget.item, contentState.items!);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
        onWillPop: () async {
          bool? result = await itemInfoViewKey.currentState?.maybePop();
          return result != null ? !result : true;
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 110),
          child: Navigator(onGenerateRoute: _tabPageRouter.generateTabRoute, initialRoute: widget.item.itemInfoViewRoute),
        ));
  }
}
