import 'package:canteen/presentation/widgets/cards/product_card.dart';
import 'package:flutter/material.dart';

class ProductsOverview extends StatelessWidget {
  const ProductsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (ctx, i) => const ProductCard(),
    );
  }
}
