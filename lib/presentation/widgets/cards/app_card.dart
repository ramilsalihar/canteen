import 'package:canteen/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.width = 300,
    this.height = 200,
    required this.title,
    required this.child,
    this.footer,
  });

  const AppCard.horizontal({
    super.key,
    this.width = 200,
    this.height = 300,
    required this.title,
    required this.child,
    this.footer,
  });

  const AppCard.vertical({
    super.key,
    this.width = 170,
    this.height = 200,
    required this.title,
    required this.child,
    this.footer,
  });

  final String title;
  final Widget child;
  final Widget? footer;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(context.dimens.borderRadius),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.displayMedium,
                ),
                const SizedBox(height: 10),
                child,
              ],
            ),
            footer != null
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: footer!,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
