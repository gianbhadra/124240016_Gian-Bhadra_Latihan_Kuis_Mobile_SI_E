import 'package:flutter/material.dart';

// StatelessWidget digunakan karena data profile tidak berubah
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // Icon profile
            const CircleAvatar(
              radius: 50,

              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 20),

            // Judul profile
            const Text(
              'Profile Pelanggan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Nama pelanggan
            const Text(
              'Nama Pelanggan',
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 5),

            // Keterangan
            const Text(
              'Pelanggan Resto Kita',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}