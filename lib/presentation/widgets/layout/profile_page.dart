import 'package:auto_route/annotations.dart';
import 'package:canteen/domain/models/user_model.dart';
import 'package:canteen/presentation/widgets/cards/bill_card.dart';
import 'package:canteen/presentation/widgets/user_widgets/balance_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Flexible(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: CircleAvatar(
                radius: 70,
                child: Icon(Icons.person, size: 70),
              ),
            ),
          ),
          Flexible(flex: 0, child: Text(user.name)),
          Flexible(flex: 0, child: Text(user.email)),
          Flexible(flex: 0, child: Text(user.phoneNumber)),
          Flexible(
              flex: 0,
              child: BalanceCard(
                balance: user.balance.toString(),
              )),
          Flexible(
            flex: 1,
            child: ListView.builder(
              itemCount: user.purchases.length,
              itemBuilder: (BuildContext context, int index) {
                return BillCard(productBill: user.purchases[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
