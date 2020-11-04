import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid/config/palette.dart';
import 'package:covid/config/style.dart';
import 'package:covid/widgets/custom_app_bar.dart';
import 'package:covid/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StatScreenglobal extends StatefulWidget {
  @override
  _StatScreenglobalState createState() => _StatScreenglobalState();
}

class _StatScreenglobalState extends State<StatScreenglobal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildReigonToolBar(),
          // _buildStatsTabBar(),
          // SizedBox(height: 5.0,),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: StatsGridGlobal(),
            ),
          ),
        ],
      ),
    );
  }

   SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver:  SliverToBoxAdapter(
        child: Text(
          'Stactics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildReigonToolBar(){
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 1,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white
            ),
            labelStyle: Style.tabTextStyle,
            labelColor: Palette.primaryColor,
            unselectedLabelColor: Colors.white,
            tabs: [
              Text('Global'),
              // Text('Global'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}
