import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  const BillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text('Customer 1'),
              subtitle: const Text('Type 1 - 100.0'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text('Customer 2'),
              subtitle: const Text('Type 2 - 200.0'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
