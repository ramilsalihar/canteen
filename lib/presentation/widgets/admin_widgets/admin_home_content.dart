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
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppCard.vertical(
                title: 'Payment Details',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Visa:'),
                    Text(
                      '1234 5678 9012 3456',
                      style: theme.textTheme.headlineSmall,
                    ),
                    const Text('Master Card'),
                    Text('1234 5678 9012 3456',
                        style: theme.textTheme.headlineSmall),
                  ],
                ),
              ),
              AppCard.vertical(
                title: 'Schedule',
                footer: Text(
                  'Last Updated: 12/12/2020',
                  style: theme.textTheme.displaySmall,
                ),
                child: const Text('No Schedule'),
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
        const HorizontalScrollView(),
      ],
    );
  }
}
