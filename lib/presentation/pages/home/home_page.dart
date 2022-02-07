import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleclub_challenge/presentation/bloc/content_cubit.dart';
import 'package:simpleclub_challenge/presentation/common/app_bar/app_bar_sliver_delegate.dart';
import 'package:simpleclub_challenge/presentation/common/tab/app_tab_bar.dart';
import 'package:simpleclub_challenge/presentation/pages/home/tab_page_view.dart';
import 'package:simpleclub_challenge/presentation/routing/app_router.dart';
import 'package:simpleclub_challenge/presentation/theme/app_theme.dart';

class HomeRoute extends CupertinoPageRoute {
  HomeRoute({required String routeName}) : super(builder: (ctx) => const HomePage(), settings: RouteSettings(name: routeName));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late ContentCubit _contentCubit;
  late TabController _tabController;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _contentCubit = context.read();
    final contentState = _contentCubit.state;
    assert(contentState.stateType == ContentStateType.success);
    _tabController = TabController(length: contentState.pages!.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
        child: BlocBuilder(
          bloc: _contentCubit,
          builder: (context, ContentState contentState) => NestedScrollView(
            controller: _scrollController,
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: _buildAppBar(contentState, forceElevated: innerBoxIsScrolled),
              ),
            ],
            body: TabBarView(
              controller: _tabController,
              children: contentState.pages!
                  .where((p) => p.itemModel != null)
                  .map((p) => TabPageView(key: ValueKey('tab_page_view_${p.id}_${p.itemId}'), page: p, item: p.itemModel!))
                  .toList(),
            ),
          ),
        ),
      ));

  Widget _buildAppBar(ContentState contentState, {bool forceElevated = false}) {
    assert(contentState.stateType == ContentStateType.success);
    return SliverPersistentHeader(
        pinned: true,
        delegate: AppBarSliverDelegate(
            height: 108,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, contentSetupRouteName, (_) => false),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 24, bottom: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(contentState.contentId!, style: Theme.of(context).textTheme.headline5),
                        const SizedBox(width: 8),
                        const Icon(Icons.edit, color: textPrimary, size: 16),
                      ],
                    ),
                  ),
                ),
                AppTabBar(
                    tabLabels: contentState.pages!.where((page) => page.itemModel != null).map((page) => page.title).toList(),
                    tabController: _tabController),
              ],
            ),
            forceElevated: forceElevated));
  }
}
