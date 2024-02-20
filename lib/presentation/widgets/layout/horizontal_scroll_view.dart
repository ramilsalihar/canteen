import 'package:canteen/domain/models/category_model.dart';
import 'package:canteen/presentation/widgets/cards/app_card.dart';
import 'package:flutter/material.dart';

List<CategoryModel> dummyCategories = [
  CategoryModel(
    categoryName: "Electronics",
    categoryCount: 120,
    categoryImage: "electronic_image_url",
  ),
  CategoryModel(
    categoryName: "Clothing",
    categoryCount: 80,
    categoryImage: "clothing_image_url",
  ),
  CategoryModel(
    categoryName: "Books",
    categoryCount: 150,
    categoryImage: "books_image_url",
  ),
  CategoryModel(
    categoryName: "Home Decor",
    categoryCount: 90,
    categoryImage: "home_decor_image_url",
  ),
  CategoryModel(
    categoryName: "Sports",
    categoryCount: 60,
    categoryImage: "sports_image_url",
  ),
];

class HorizontalScrollView extends StatelessWidget {
  const HorizontalScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemExtent: 300,
          padding: const EdgeInsets.all(10),
          itemCount: dummyCategories.length,
          itemBuilder: (context, index) {
            final cat = dummyCategories[index];
            return AppCard(
              title: cat.categoryName,
              footer: Text(
                'Total: ${cat.categoryCount}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              child: const Text('No Content'),
            );
          },
        ),
      ),
    );
  }
}
