import 'package:flutter/material.dart';

class CartNeedsAuth extends StatelessWidget {
  const CartNeedsAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Text('Авторизуйтесь чтобы продолжить!', style: TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Войти по номеру'),
          )
        ],
      ),
    );
  }
}
