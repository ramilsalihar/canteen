import 'package:canteen/presentation/widgets/admin_widgets/customer_card.dart';
import 'package:canteen/presentation/widgets/forms/app_search_bar.dart';
import 'package:flutter/material.dart';

class PeopleListContent extends StatelessWidget {
  const PeopleListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 0,
          child: AppSearchBar(),
        ),
        Flexible(
          flex: 1,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return CustomerCard(
                name: 'Customer $index',
                customerType: 'Type $index',
                balance: index * 100.0,
              );
            },
          ),
        ),
      ],
    );
  }
}
