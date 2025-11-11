import 'package:flutter/material.dart';

class BetSlip extends StatelessWidget {
  final int items;
  final VoidCallback onOpen;

  const BetSlip({super.key, required this.items, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 18,
      child: GestureDetector(
        onTap: onOpen,
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0,4))],
          ),
          child: Row(
            children: [
              const Icon(Icons.receipt_long, color: Colors.white),
              const SizedBox(width: 12),
              Text('Cupom (${items})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                child: const Text('APOSTAR'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
