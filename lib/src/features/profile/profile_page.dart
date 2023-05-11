import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Julian C. (DEADLINE - Belum Selesai)'),
            Text(' Featured: '),
            Text('- Clean architecture'),
            Text('- Dependencies injection'),
            Text('NOTE: Masih banyak yang bisa diimprove'),
          ],
        ),
      ),
    );
  }
}
