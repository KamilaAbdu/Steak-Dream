import 'package:flutter/material.dart';
import '../../domain/entities/cart_item.dart';

class CartListView extends StatelessWidget {
  final List<CartItem> items;

  const CartListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final total = items.fold<int>(0, (sum, item) => sum + item.total);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              final item = items[index];
              return ListTile(
                leading: Image.asset(item.imageUrl, width: 60),
                title: Text(item.title),
                subtitle: Text('x${item.quantity}'),
                trailing: Text('${item.total} сом'),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Общая сумма", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              Text("$total сом", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
