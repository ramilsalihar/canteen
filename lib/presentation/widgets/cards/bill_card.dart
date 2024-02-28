import 'package:canteen/domain/models/product_bill_model.dart';
import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  const BillCard({
    super.key,
    required this.productBill,
  });

  final ProductBillModel productBill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bill'),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                const TableRow(
                  children: [
                    Text('Product Name'),
                    Text('Quantity'),
                    Text('Price'),
                  ],
                ),
                ...productBill.products.map((product) {
                  return TableRow(
                    children: [
                      Text(product.nameOfProduct),
                      Text(product.quantity.toString()),
                      Text(product.price.toString()),
                    ],
                  );
                }).toList(),
              ],
            ),
            const Divider(),
            Table(
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    Text('Total'),
                    Text(''),
                    Text('400'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
