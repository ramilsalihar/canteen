import 'package:canteen/presentation/widgets/cards/app_card.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "title",
      child: Column(
        children: [
          Text(
            "title",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            "price",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
