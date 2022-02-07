import 'package:flutter/material.dart';
import 'package:simpleclub_challenge/presentation/theme/app_theme.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    Key? key,
    required this.tabLabels,
    this.tabController,
  }) : super(key: key);

  final List<String> tabLabels;
  final TabController? tabController;

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: tabLabels.length,
        child: TabBar(
          controller: tabController,
          tabs: List.generate(
              tabLabels.length, (index) => Tab(child: Text(tabLabels[index], maxLines: 1, overflow: TextOverflow.clip, softWrap: false))),
          isScrollable: true,
          labelStyle: Theme.of(context).textTheme.subtitle1,
          indicatorColor: primaryColor,
        ),
      );
}
