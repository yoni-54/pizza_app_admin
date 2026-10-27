import 'package:flutter/material.dart';

class CreatePizzaScreen extends StatelessWidget {
  const CreatePizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(children: [Text('Create a New Pizza !')]),
      ),
    );
  }
}
