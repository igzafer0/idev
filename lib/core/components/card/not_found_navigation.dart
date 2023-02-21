import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotFoundNavigation extends StatelessWidget {
  const NotFoundNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Sayfa Bulunamadı"),
      ),
    );
  }
}
