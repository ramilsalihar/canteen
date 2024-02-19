import 'package:canteen/presentation/widgets/cards/app_card.dart';
import 'package:canteen/presentation/widgets/layout/horizontal_scroll_view.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Admin Home',
            style: theme.textTheme.displayMedium,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppCard.vertical(
                title: 'Card 1',
                child: const Text('Card 1'),
                footer: 'Footer 1',
              ),
              AppCard.vertical(
                title: 'Card 2',
                child: const Text('Card 2'),
                footer: 'Footer 2',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Admin Home',
            style: theme.textTheme.displayMedium,
          ),
        ),
        HorizontalScrollView(),
      ],
    );
  }
}
