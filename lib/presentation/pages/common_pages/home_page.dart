import 'package:auto_route/auto_route.dart';
import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:canteen/presentation/widgets/admin_widgets/admin_home_content.dart';
import 'package:canteen/presentation/widgets/admin_widgets/admin_qr_code.dart';
import 'package:canteen/presentation/widgets/admin_widgets/people_list_content.dart';
import 'package:canteen/presentation/widgets/layout/app_bottom_bar.dart';
import 'package:canteen/presentation/widgets/layout/app_drawer.dart';
import 'package:canteen/presentation/widgets/layout/app_top_bar.dart';
import 'package:canteen/presentation/widgets/user_widgets/shop_content.dart';
import 'package:canteen/presentation/widgets/user_widgets/user_home_content.dart';
import 'package:canteen/presentation/widgets/user_widgets/user_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthBloc>().isAdmin;
    final theme = Theme.of(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppTopBar(
        scaffoldKey: scaffoldKey,
      ),
      body: _getBody(selectedIndex, isAdmin),
      bottomNavigationBar: AppBottomBar(
        selectedIndex: selectedIndex,
        onItemTapped: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      drawer: const AppDrawer(),
      floatingActionButton: (selectedIndex == 1 && isAdmin)
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

Widget _getBody(int index, bool isAdmin) {
  if (isAdmin) {
    switch (index) {
      case 0:
        return const PeopleListContent();
      case 1:
        return const AdminHomeContent();
      case 2:
        return const AdminQrCode();
      default:
        return const AdminHomeContent();
    }
  } else {
    switch (index) {
      case 0:
        return const ShopContent();
      case 1:
        return const UserHomeContent();
      case 2:
        return const UserQrCode();
      default:
        return const UserHomeContent();
    }
  }
}
