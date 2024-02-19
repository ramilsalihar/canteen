import 'package:auto_route/auto_route.dart';
import 'package:canteen/presentation/widgets/admin_widgets/home_content.dart';
import 'package:canteen/presentation/widgets/admin_widgets/people_list_content.dart';
import 'package:canteen/presentation/widgets/admin_widgets/qr_code_content.dart';
import 'package:canteen/presentation/widgets/layout/app_bottom_bar.dart';
import 'package:canteen/presentation/widgets/layout/app_drawer.dart';
import 'package:canteen/presentation/widgets/layout/app_top_bar.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppTopBar(
        scaffoldKey: scaffoldKey,
      ),
      body: _getBody(selectedIndex),
      bottomNavigationBar: AppBottomBar(
        selectedIndex: selectedIndex,
        onItemTapped: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      drawer: const AppDrawer(),
      floatingActionButton: selectedIndex == 1
          ? FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

Widget _getBody(int index) {
  switch (index) {
    case 0:
      return const PeopleListContent();
    case 1:
      return const HomeContent();
    case 2:
      return const QrCodeContent();
    default:
      return const HomeContent();
  }
}
