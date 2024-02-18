import 'package:canteen/presentation/widgets/cards/app_card.dart';
import 'package:flutter/material.dart';

class HorizontalScrollView extends StatelessWidget {
  const HorizontalScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    return SizedBox(
      height: 200,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemExtent: 300,
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return AppCard(
            description: 'Card $index',
          );
        },
      ),
    );
  }
}
