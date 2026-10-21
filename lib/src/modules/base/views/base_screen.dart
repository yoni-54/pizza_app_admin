import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  const BaseScreen(this.child, {super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red);
  }
}
