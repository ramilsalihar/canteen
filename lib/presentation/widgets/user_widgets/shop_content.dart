import 'package:canteen/presentation/widgets/common_widgets/products_overview.dart';
import 'package:canteen/presentation/widgets/forms/app_search_bar.dart';
import 'package:flutter/material.dart';

class ShopContent extends StatelessWidget {
  const ShopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 0,
          child: AppSearchBar(),
        ),
        Flexible(
          child: const ProductsOverview(),
        ),
      ],
    );
  }
}
