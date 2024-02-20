import 'package:auto_route/annotations.dart';
import 'package:canteen/presentation/widgets/cards/bill_card.dart';
import 'package:canteen/presentation/widgets/user_widgets/balance_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 0,
          child: const Padding(
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
        Flexible(flex: 0, child: Text('Ramil Salihar')),
        Flexible(flex: 0, child: Text('ramil.salihar_2025@ucentralasia.org')),
        Flexible(flex: 0, child: Text('02/02/2025')),
        Flexible(flex: 0, child: BalanceCard()),
        Flexible(
          flex: 1,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return BillCard();
            },
          ),
        ),
      ],
    );
  }
}
