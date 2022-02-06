import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleclub_challenge/presentation/bloc/content_cubit.dart';
import 'package:simpleclub_challenge/presentation/models/item_model.dart';
import 'package:simpleclub_challenge/presentation/routing/tab_page_router.dart';

class TabPageView extends StatefulWidget {
  const TabPageView({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  State<TabPageView> createState() => _TabPageViewState();
}

class _TabPageViewState extends State<TabPageView> {
  late ContentCubit _contentCubit;
  late TabPageRouter _tabPageRouter;

  @override
  void initState() {
    super.initState();
    _contentCubit = context.read();
    final contentState = _contentCubit.state;
    assert(contentState.stateType == ContentStateType.success);
    _tabPageRouter = TabPageRouter(widget.item, contentState.items!);
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverFillRemaining(
              child: Navigator(onGenerateRoute: _tabPageRouter.generateTabRoute, initialRoute: widget.item.itemInfoViewRoute)),
        ],
      );
}
