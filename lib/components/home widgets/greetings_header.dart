import 'package:flutter/material.dart';

class GreetingsHeader extends StatefulWidget {
  const GreetingsHeader({super.key});

  @override
  State<GreetingsHeader> createState() => _GreetingsHeaderState();
}

class _GreetingsHeaderState extends State<GreetingsHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.wb_twilight,
                    color: Colors.yellow[900],
                  ),
                  const Text('Good Morning'),
                ],
              ),
              const Text(
                'Alena Sabyan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Icon(Icons.shopping_cart_outlined)
        ],
      ),
    );
  }
}
