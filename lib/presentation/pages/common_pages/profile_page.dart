import 'package:auto_route/annotations.dart';
import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:canteen/presentation/widgets/buttons/app_swipe_button.dart';
import 'package:canteen/presentation/widgets/cards/app_card.dart';
import 'package:canteen/presentation/widgets/cards/bill_card.dart';
import 'package:canteen/presentation/widgets/user_widgets/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.user,
  });

  final dynamic user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAdmin = BlocProvider.of<AuthBloc>(context).isAdmin;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: CircleAvatar(
                radius: 70,
                child: Text(
                  user.name[0],
                  style: theme.textTheme.displayLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 0,
            child: Text(
              '${user.name} ${user.surname}',
              style: theme.textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            flex: 0,
            child: Text(
              user.email,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            flex: 0,
            child: Text(
              user.phoneNumber,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 15),
          Flexible(
            flex: 0,
            child: isAdmin
                ? const AppSwipeButton()
                : BalanceCard(
                    balance: user.balance.toString(),
                  ),
          ),
          Flexible(
            flex: 1,
            child:
                isAdmin ? _buildAdminBody(user, context) : _buildUserBody(user),
          ),
        ],
      ),
    );
  }
}

Widget _buildAdminBody(dynamic user, BuildContext context) {
  final theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: ListView(
        children: [
          AppCard(
            title: 'Payment Details',
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Balance: ${user.paymentDetails}',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'Purchases: ${user.schedule}',
                  style: theme.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          AppCard(
            title: 'Schedule',
            child: Text(
              user.schedule.toString(),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildUserBody(dynamic user) {
  return ListView.builder(
    itemCount: user.purchases.length,
    itemBuilder: (BuildContext context, int index) {
      return BillCard(productBill: user.purchases[index]);
    },
  );
}
