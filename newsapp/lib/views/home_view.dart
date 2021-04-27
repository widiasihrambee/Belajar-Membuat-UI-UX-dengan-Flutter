import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/views/popular_tab_view.dart';
import 'package:newsapp/views/recent_tab_view.dart';
import 'package:newsapp/views/trending_tab_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "WELCOME",
                  textAlign: TextAlign.end,
                  style: KNonActiveTabStyle,
                ),
                subtitle: Text(
                  "Jessica Veranda",
                  textAlign: TextAlign.end,
                  style: KActiveTabStyle,
                ),
                trailing: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("assets/ve.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: KGrey1,
                  unselectedLabelStyle: KNonActiveTabStyle,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelStyle: KActiveTabStyle.copyWith(fontSize: 25.0),
                  tabs: [
                    Tab(text: "Popular"),
                    Tab(text: "Trending"),
                    Tab(text: "Recent"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PopularTabView(),
            TrendingTabView(),
            RecentTabView(),
          ],
        ),
      ),
    );
  }
}
