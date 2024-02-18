import 'package:auto_route/auto_route.dart';
import 'package:canteen/presentation/widgets/cards/app_card.dart';
import 'package:canteen/presentation/widgets/layout/app_bottom_bar.dart';
import 'package:canteen/presentation/widgets/layout/app_drawer.dart';
import 'package:canteen/presentation/widgets/layout/app_top_bar.dart';
import 'package:canteen/presentation/widgets/layout/horizontal_scroll_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppTopBar(
        scaffoldKey: _scaffoldKey,
        title: 'Admin Home',
      ),
      body: Column(
        children: [
          Text('Admin Home'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppCard(
                description: 'Card 1',
              ),
              AppCard(
                description: 'Card 2',
              ),
            ],
          ),
          Text('Admin Home'),
          HorizontalScrollView(),
        ],
      ),
      bottomNavigationBar: AppBottomBar(
        selectedIndex: 0,
        onItemTapped: (int index) {
          context.router.pop();
        },
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
