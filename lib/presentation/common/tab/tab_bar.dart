import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    Key? key,
    required this.tabLabels,
    this.tabController,
    this.valueChanged,
  }) : super(key: key);

  final List<String> tabLabels;
  final TabController? tabController;
  final ValueChanged<int>? valueChanged;

  void _onTabTap(int index) {
    if (valueChanged != null) {
      valueChanged!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final selectedTabTextStyle = AppExtendedTheme.of(context).subtitle2BoldHeader;
    // final unselectedTabTextStyle = Theme.of(context).textTheme.subtitle2;

    return DefaultTabController(
      length: tabLabels.length,
      child: TabBar(
        controller: tabController,
        tabs: List.generate(tabLabels.length, (index) => Tab(child: Text(tabLabels[index], maxLines: 1, overflow: TextOverflow.clip, softWrap: false))),
        onTap: _onTabTap,
        indicator: const UnderlineTabIndicator(borderSide: const BorderSide(width: 2.0, color: Colors.red)),
        isScrollable: true,
        // labelPadding: const EdgeInsets.only(left: 16, right: 4),
        labelStyle: Theme.of(context).textTheme.subtitle1,
        labelColor: const Color(0xFF262626),
      ),
    );
  }
}
