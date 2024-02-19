import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.name,
    required this.customerType,
    required this.balance,
  });

  final String name;
  final String customerType;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(name),
      subtitle: Text('$customerType - $balance'),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
