import 'package:canteen/presentation/widgets/forms/app_search_bar.dart';
import 'package:flutter/material.dart';

// ProductModel productA =
//     ProductModel(name: 'Product A', price: 20.0, image: '', quantity: 1);
// ProductModel productB =
//     ProductModel(name: 'Product B', price: 30.0, image: '', quantity: 1);
//
// // Create dummy product bills for users
// ProductBillModel bill1 = ProductBillModel(
//     id: '001',
//     date: '2024-02-19',
//     products: [productA, productB, productA],
//     total: '20.0');
// ProductBillModel bill2 = ProductBillModel(
//     id: '002', date: '2024-02-18', products: [productB], total: '30.0');

// Create a list of dummy users with associated product bills
// List<UserModel> dummyUsers = [
//   UserModel(
//     id: '1',
//     name: 'John',
//     surname: 'Doe',
//     email: 'john.doe@example.com',
//     userType: 'Regular',
//     phoneNumber: '123-456-7890',
//     balance: 100.0,
//     purchases: [bill1, bill2],
//   ),
//   UserModel(
//     id: '2',
//     name: 'Jane',
//     surname: 'Smith',
//     email: 'jane.smith@example.com',
//     userType: 'Premium',
//     phoneNumber: '987-654-3210',
//     balance: 150.0,
//     purchases: [bill2, bill1],
//   ),
// ];

class PeopleListContent extends StatelessWidget {
  const PeopleListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Flexible(
          flex: 0,
          child: AppSearchBar(),
        ),
        // Flexible(
        //   flex: 1,
        // child: ListView.builder(
        //   itemCount: dummyUsers.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final user = dummyUsers[index];
        //     return CustomerCard(
        //       user: user,
        //     );
        //   },
        // ),
        // ),
      ],
    );
  }
}
