import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Julian C. (DEADLINE - Belum Selesai)'),
          Text(' Featured: '),
          Text('- clean architecture'),
          Text('- dependencies injection'),
        ],
      ),
    );
  }
}
