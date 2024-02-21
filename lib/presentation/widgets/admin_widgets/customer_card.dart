import 'package:auto_route/auto_route.dart';
import 'package:canteen/core/routes/app_router.gr.dart';
import 'package:canteen/domain/models/user_model.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.pushRoute(ProfileRoute(user: user));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(user.name),
            subtitle: Text(user.userType),
            trailing: Text('Balance: \$${user.balance.toStringAsFixed(0)}'),
          ),
        ),
      ),
    );
  }
}
